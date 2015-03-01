class TagsController < ApplicationController
  include InstagramTagRepoInjector

  def index
    query = params[:hashtag].present? ? params[:hashtag] : 'featured'

    @tags = instagram_tag_repo.search(query)
  end

  def create
    HashtagRepo.new.create(user_id: current_user.id, name: params[:hashtag])

    redirect_to tags_path(params), flash: { notice: "Hashtag ##{params[:hashtag]} was saved!" }
  end

  def search
    redirect_to tags_path(params)
  end

end
