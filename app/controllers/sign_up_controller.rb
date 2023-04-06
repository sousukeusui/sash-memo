class SignUpController < ApplicationController
  def step1

  end
  
  def step2(name:, email:, password:, password_confirmation:)
    render :step1 if password != password_confirmation #バリデーション考える
    session[:name] = name
    session[:email] = email
    session[:password] = password
    #認証コードをメールアドレスに送信
    ConfirmMailer.send_when_sign_up_step1(email: email, name: name).deliver
  end

  def create
    
  end

  def done

  end

  def send_email
    
  end
end
