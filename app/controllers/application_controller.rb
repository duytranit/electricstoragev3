class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale

  private
  def set_locale
    if cookies[:locale].nil?
      cookies[:locale] = 'vi'
    end
    if params[:locale].present?
      cookies[:locale] = params[:locale]
    end
    I18n.locale = cookies[:locale]
  end

  def check_staff_login
	  if !(user_signed_in? && current_user.is_staff?)
		  flash[:notice] = t("views.does_staff_login")
		  redirect_to root_path
	  end
  end
end
