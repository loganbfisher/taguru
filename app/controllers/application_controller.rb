class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :check_instagram_auth

  include InstagramAuthRepoInjector

  def check_instagram_auth
    if params[:code].present?
      resp = instagram_auth_repo.create_token(params[:code])

      current_user.update_attributes!(instagram_access_token: resp['access_token'])
    end
  end

  def current_instagram_token
    @current_instagram_token ||= current_user.instagram_access_token
  end
  helper_method :current_instagram_token

  def current_user_tags
    Hashtag.where(user_id: current_user.id)
  end
  helper_method :current_user_tags

end
