module DetailedHashtagsAdapterInjector
  def detailed_hashtags_adapter
    @detailed_hashtags_adapter ||= DetailedHashtagsAdapter.new({ user_id: current_user.id, instagram_token: current_instagram_token })
  end
end