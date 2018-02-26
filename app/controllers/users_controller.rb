class UsersController < ApplicationController
  def index
    options = {}
    options[:meta] = { total_itens: User.all.count, teste_key: 'teste' }

    render json: UserSerializer.new(User.all, options).serialized_json
  end
end
