class ArticlesController < ApplicationController
  # before_action :authenticate_user!

  def index
    options = {}
    # options[:meta]    = { total_itens: 1, name: 'bla' }
    # options[:include] = [:user]

    render json: ArticleSerializer.new(Article.all, options).serialized_json
  end
end
