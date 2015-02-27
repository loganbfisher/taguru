class TagsAdapter
  include TagsServiceInjector

  def initialize(config = {})
    self.current_user = config[:current_user]
    self.instagram_token = config[:instagram_token]
  end

  def followed_data
    traverse_data(current_user_tags)
  end

  private

  attr_accessor :current_user, :instagram_token

  def traverse_data(tags)
    threads = []

    tags.each do |tag|
      threads << Thread.new do
        response_data = tags_service.search(tag[:name])
        response_data['data'].each { |result| result['hashtag'] = tag.name }
      end
    end
    data = threads.map{ |thread| thread.value }

    sort(data)
  end

  def current_user_tags
    Hashtag.where(user_id: current_user.id)
  end

  def flattened_tags(tags)
    tags.flatten!
  end

  def sort(tags)
    flattened_tags(tags).sort_by { | hashtag | hashtag['created_time'] }.reverse
  end

end