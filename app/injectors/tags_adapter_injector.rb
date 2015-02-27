module TagsAdapterInjector
  def tags_adapter
    @tags_adapter ||= TagsAdapter.new({ current_user: current_user, instagram_token: current_instagram_token  })
  end
end