# frozen_string_literal: true

# :nodoc:
module Roles::User
  extend ActiveSupport::Concern

  included do
    # USER
    def user
      can [:crud], User, id: @user.id
      can [:crud], Article, user: @user
    end
  end
end
