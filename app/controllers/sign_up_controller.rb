class SignUpController < ApplicationController
  def step1

  end
  
  def step2(name:, email:, password:, password_confirmation:)
    render :step1 if password != password_confirmation #バリデーション考える
    session[:name] = name
    session[:email] = email
    session[:password] = password
    #認証コードをメールアドレスに送信
    create_and_send_confirmation_code(email: email, name: name)
  end

  def create(confirmation_code:)
    if check_confirmation_code(confirmation_code: confirmation_code)
      user = User.new(
        name: session[:name],
        email: session[:email],
        password: session[:password]
      )
      if user.save!
        sign_in(:user, user)
        redirect_to done_sign_up_index_path, notice: 'アカウントの作成が完了しました'
      end
    else
      redirect_to step2_sign_up_index_path, alert: '認証コードが間違っています'
    end
  end

  def done
    p current_user
  end

  def create_and_send_confirmation_code(email:, name:)
    context = OneTimeAuthentication.find_context(:sign_up)
    one_time_authentication = OneTimeAuthentication.create_one_time_authentication(
      context,
      email
    )
    ConfirmMailer.send_when_sign_up_step1(email: email, name: name, confirmation_code: one_time_authentication.password).deliver
    session[:client_token] = one_time_authentication.client_token
  end

  def check_confirmation_code(confirmation_code:)
    context = OneTimeAuthentication.find_context(:sign_up)
    one_time_authentication = OneTimeAuthentication.find_one_time_authentication(
      context,
      session[:email]
    )
    new_client_token = one_time_authentication.authenticate_one_time_client_token!(session[:client_token])
    one_time_password = one_time_authentication.authenticate_one_time_password!(confirmation_code)
    valid_faile_count = one_time_authentication.under_valid_failed_count?
    if new_client_token && one_time_password && valid_faile_count
      return true
    else
      return false
    end
  end
end
