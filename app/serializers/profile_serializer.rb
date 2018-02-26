class ProfileSerializer
  include FastJsonapi::ObjectSerializer

  attributes :age
  belongs_to :user
end
