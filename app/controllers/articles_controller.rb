class ArticlesController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    options = {}
    # options[:meta]    = { total_itens: 1, name: 'bla' }
    # options[:include] = [:user]

    render json: ArticleSerializer.new(@articles, options).serialized_json
  end
end
