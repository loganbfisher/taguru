class InstagramInitializer
  def self.get_auth_token(code)
    RestClient.post 'https://api.instagram.com/oauth/access_token', :client_id => ENV["INSTAGRAM_CLIENT_ID"], :redirect_uri => ENV["INSTAGRAM_REDIRECT_URL"], :client_secret => ENV["INSTAGRAM_CLIENT_SECRET"], :grant_type => 'authorization_code', :code => code
  end
end