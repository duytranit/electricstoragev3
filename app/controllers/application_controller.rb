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
end
