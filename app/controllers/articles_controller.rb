class ArticlesController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: ArticleSerializer.new(Article.all).serialized_json
  end
end
