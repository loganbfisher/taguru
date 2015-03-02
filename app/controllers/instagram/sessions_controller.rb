class Instagram::SessionsController < ApplicationController
  include InstagramAuthRepoInjector

  def destroy
    instagram_auth_repo.delete_token(current_user.id)

    redirect_to root_path
  end

end