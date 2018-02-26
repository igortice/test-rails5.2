class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email, :age
  set_type :usuario
  has_one :profile, record_type: :perfil
  has_many :articles, record_type: :artigo
end
