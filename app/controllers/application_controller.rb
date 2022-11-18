class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :matric_number, :level])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin, :matric_number, :level])
    end
end
