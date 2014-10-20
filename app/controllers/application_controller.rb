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

  def add_project_to_cart(project_id)
	  (session[:storage] ||= []) << project_id
  end

  def current_cart(customer_id)
    customer = User.find(customer_id)
    invoice = Invoice.where(["user_id = ? AND payment IS NULL", customer_id]).first
    invoice = customer.invoices.create if !invoice
    return invoice
  end
end
