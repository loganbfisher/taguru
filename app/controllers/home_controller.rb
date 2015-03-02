class HomeController < ApplicationController
  include DetailedHashtagsAdapterInjector

  def index
    return unless current_instagram_token.present?

    @tags = detailed_hashtags_adapter.followed_data
  end

end
