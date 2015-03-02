class InstagramAuthRepo

  def create_token(code)
    resp = RestClient.post 'https://api.instagram.com/oauth/access_token', client_id: ENV["INSTAGRAM_CLIENT_ID"], redirect_uri: ENV["INSTAGRAM_REDIRECT_URL"], client_secret: ENV["INSTAGRAM_CLIENT_SECRET"], grant_type: 'authorization_code', code: code

    parse_json(resp)
  end

  def delete_token(user_id)
    user = User.where(id: user_id).first
    user.instagram_access_token = ''
    user.save!
  end

  private

  def parse_json(resp)
    JSON.parse(resp)
  end

end