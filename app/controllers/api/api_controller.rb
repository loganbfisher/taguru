class Api::ApiController < ApplicationController
  respond_to :json

  def render_404
    head 404, "content_type" => 'text/plain'
  end

  private

  def default_serializer_options
    { root: false }
  end

end