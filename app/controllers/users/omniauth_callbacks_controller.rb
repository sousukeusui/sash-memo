# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line 
    callback_for
  end

  def google_oauth2
    callback_for
  end

  private
  
  def callback_for
    user = User.from_omniauth(omniauth: request.env["omniauth.auth"])
    if user.persisted?
      flash[:notice] = 'ログインしました'
      sign_in_and_redirect user
    else
      flash[:notice] = 'ログインできません'
      redirect_to new_user_session_path
    end
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
