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

  def destroy
    Hashtag.where(user_id: current_user.id, id: params[:tag_id]).first.destroy

    redirect_to root_path
  end

end
