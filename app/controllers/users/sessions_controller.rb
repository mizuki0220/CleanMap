class Public::Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: 'Hello! Guest!'
  end


  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:email][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_user_registration_path
      end
    else
        flash[:error] = "項目を入力してください"
    end
  end
end