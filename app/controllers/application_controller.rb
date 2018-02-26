class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Accesso negado em #{exception.action} #{exception.subject.inspect}"

    render json: { errors: ["Accesso negado em #{exception.action} de #{exception.subject.name.pluralize}"] },
           status: :forbidden
  end
end
