module InstagramAuthRepoInjector
  def instagram_auth_repo
    @instagram_auth_repo ||= InstagramAuthRepo.new
  end
end