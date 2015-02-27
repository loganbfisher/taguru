class TagsService
  include TagsAdapterInjector

  def initialize(config = {})
    self.current_user = config[:current_user]
    self.instagram_token = config[:instagram_token]
  end

  def create(params)
    tag = Hashtag.new(user_id: current_user.id, name: params[:hashtag])
    tag.save
  end

  def featured
    resp = RestClient.get "https://api.instagram.com/v1/tags/featured/media/recent?access_token=#{instagram_token}"
    parse_json(resp)
  end

  def followed
    tags_adapter.followed_data
  end

  def search(params)
    resp = RestClient.get "https://api.instagram.com/v1/tags/#{params}/media/recent?access_token=#{instagram_token}"
    parse_json(resp)
  end

  private

  attr_accessor :current_user, :instagram_token

  def parse_json(resp)
    JSON.parse(resp)
  end

end