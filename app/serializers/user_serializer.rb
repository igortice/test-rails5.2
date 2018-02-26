class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email, :age
  set_type :usuario
  has_one :profile
  has_many :articles
end
