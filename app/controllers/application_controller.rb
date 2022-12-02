class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
            events_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :admin])
    end

end