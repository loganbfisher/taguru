class Api::TagsController < Api::ApiController
  include DetailedHashtagsAdapterInjector
  include InstagramTagRepoInjector

  def index
    render json: detailed_hashtags_adapter.followed_data
  end

  def create
    render json: HashtagRepo.new.create(params)
  end

  def search
    render json: instagram_tag_repo.search(params)
  end

end