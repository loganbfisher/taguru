class HashtagRepo

  def create(params)
    tag = Hashtag.new(user_id: params[:user_id], name: params[:name])
    tag.save
  end

  def all(user_id)
    Hashtag.where(user_id: user_id)
  end

end