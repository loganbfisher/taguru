module TagsServiceInjector
  def tags_service
    @tags_service ||= TagsService.new({ current_user: current_user, instagram_token: current_instagram_token  })
  end
end