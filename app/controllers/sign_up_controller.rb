class SignUpController < ApplicationController
  before_action :validates_step1, only: :step2

  def index
    
  end
  
  def step1
    
  end
  
  def step2(email:, name:)
    #認証コードをメールアドレスに送信
    create_and_send_confirmation_code(email: email, name: name)
  end

  def create(confirmation_code:)
    user = User.new(
      name: session[:name],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    if check_confirmation_code?(confirmation_code: confirmation_code) && user.save!
      sign_in(:user, user)
      redirect_to sign_up_done_path, notice: 'アカウントの作成が完了しました'
    else
      redirect_to sign_up_step2_path, alert: '認証コードが間違っています'
    end
  end

  def done

  end

  def resend_confirmation_code
    create_and_send_confirmation_code(email: session[:email], name: session[:name])
    render :step2, notice: '確認コードを再送しました'
  end


  private

  def validates_step1(name:, email: ,password:, password_confirmation:)
    session[:name] = name
    session[:email] = email
    session[:password] = password
    session[:password_confirmation] = password_confirmation

    user = User.new(
      name: session[:name],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    
    redirect_to sign_up_step1_path, notice: user.errors.full_messages unless user.valid?
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

  def check_confirmation_code?(confirmation_code:)
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
