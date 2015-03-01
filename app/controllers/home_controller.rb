class HomeController < ApplicationController
  include DetailedHashtagsAdapterInjector

  def index
    @tags = detailed_hashtags_adapter.followed_data
  end

end
