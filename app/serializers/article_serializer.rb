class ArticleSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :body, :user_id
end
