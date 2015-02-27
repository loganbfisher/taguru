class HomeController < ApplicationController

  def index
    @tags = TagsAdapter.get_followed_tags(current_user, current_access_token)
  end

end
