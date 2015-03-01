class DetailedHashtagsAdapter
  include InstagramTagRepoInjector

  def initialize(config = {})
    self.user_id = config[:user_id]
    self.current_instagram_token = config[:instagram_token]
  end

  def followed_data
    traverse_data(HashtagRepo.new.all(user_id))
  end

  private

  attr_accessor :user_id, :current_instagram_token

  def traverse_data(tags)
    threads = []

    tags.each do |tag|
      threads << Thread.new do
        response_data = instagram_tag_repo.search(tag[:name])
        response_data['data'].each { |result| result['hashtag'] = tag.name }
      end
    end
    data = threads.map{ |thread| thread.value }

    sort(data)
  end

  def flattened_tags(tags)
    tags.flatten!
  end

  def sort(tags)
    flattened_tags(tags).sort_by { | hashtag | hashtag['created_time'] }.reverse
  end

end