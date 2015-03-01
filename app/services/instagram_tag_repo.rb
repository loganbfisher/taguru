class InstagramTagRepo

  def initialize(config = {})
    self.current_instagram_token = config[:instagram_token]
  end

  def featured
    resp = RestClient.get "https://api.instagram.com/v1/tags/featured/media/recent?access_token=#{current_instagram_token}"
    parse_json(resp)
  end

  def search(params)
    resp = RestClient.get "https://api.instagram.com/v1/tags/#{params}/media/recent?access_token=#{current_instagram_token}"
    parse_json(resp)
  end

  private

  attr_accessor :current_instagram_token

  def parse_json(resp)
    JSON.parse(resp)
  end

end