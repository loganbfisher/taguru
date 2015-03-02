class Api::Instagram::SessionsController < Api::ApiController
  include InstagramAuthRepoInjector

  def create
    render json: instagram_auth_repo.create_token(params[:code])
  end

  def destroy
    render json: instagram_auth_repo.delete_token(params[:user_id])
  end

end