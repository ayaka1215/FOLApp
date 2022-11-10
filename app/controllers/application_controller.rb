class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        if current_user.admin
            admin_events_path
        else
            events_path
        end
         
    end

    def after_sign_out_path_for(resource)
        root_path
    end
end