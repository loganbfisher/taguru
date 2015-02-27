class Api::TagsController < Api::ApiController
  include TagsServiceInjector

  def index
    render json: tags_service.followed
  end

  def create
    render json: tags_service.create(params)
  end

end