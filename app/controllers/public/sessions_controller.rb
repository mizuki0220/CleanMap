# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def after_sign_in_path_for(resource)
    map_homes_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'Hello! Guest!'
  end


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_user_registration_path
      end
    else
        flash[:error] = "項目を入力してください"
        redirect_to new_user_registration_path
    end
  end

end
