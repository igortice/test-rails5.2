class Ability
  include CanCan::Ability
  include ::Roles::User

  def initialize(user)
    @user = user || User.new

    alias_action :create, :read, :update, :destroy, to: :crud

    send(@user.role.to_sym) if @user.role
  end
end
