class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def after_sign_up_path_for(resource)
    posts_path
  end

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'Guests cannot be deleted.'
    end
  end

end