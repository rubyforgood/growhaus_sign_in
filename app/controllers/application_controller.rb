# Allows toggling between english and spanish language versions
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :verify_authenticity_token

  def verify_authenticity_token
    true
  end

  def restrict_access
    return if ENV['GROWHAUS_DISABLE_AUTH'].present? && !Rails.env.production?
    redirect_to login_path unless Staff.where(id: session[:user_id]).first
  end

  def restrict_to_staff
    redirect_to welcome_path unless session[:welcome_mode].blank?
  end

  helper_method :current_user

  def current_user
    @current_user ||= Staff.find_by(id: session[:user_id])
  end

  before_action :set_locale, :set_i18n_toggle

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def set_i18n_toggle
    if I18n.locale == :en
      @i18n_toggle_locale_text = 'Espa&ntilde;ol'.html_safe
      @i18n_toggle_locale_param = params.merge locale: 'es'
    else
      @i18n_toggle_locale_text = 'English'
      @i18n_toggle_locale_param = params.merge locale: 'en'
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
