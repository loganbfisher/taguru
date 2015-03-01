module InstagramTagRepoInjector
  def instagram_tag_repo
    @instagram_tag_repo ||= InstagramTagRepo.new({ instagram_token: current_instagram_token })
  end
end