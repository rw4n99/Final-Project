class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def set_locale
    if params[:locale].blank?
      redirect_to url_for(locale: I18n.default_locale) and return
    else
      I18n.locale = params[:locale]
    end
  end
end
