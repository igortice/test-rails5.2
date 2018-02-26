class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_one :profile
  delegate :age, to: :profile, allow_nil: true
  has_many :articles

  enum role: {
    super_admin: 100,
    admin:       50,
    user:        1
  }
end
