class CookiesController < ApplicationController
    def set_cookie
      cookies[:analytics_consent] = { value: params[:cookies][:analytics], expires: 1.year.from_now }
      redirect_back(fallback_location: root_path)
    end
  end