class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!
  before_filter :check_instragram_auth

  rescue_from RestClient::BadRequest do |exception|
    pp exception
    flash[:notice] = 'woops something went wrong.'
  end

  def check_instragram_auth
    if params[:code].present?
      resp = InstagramInitializer.get_auth_token(params[:code])
      response_format = JSON.parse(resp)

      session[:instagram_user] = response_format["user"]
      session[:instagram_token] = response_format["access_token"]
      session[:code] = params[:code]
    end

    if session[:instagram_token].present?
      @current_instagram_user = session[:instagram_user]
      @current_instagram_token = session[:instagram_token]
    end

  end

  def current_instagram_token
    @current_instagram_token
  end

end
