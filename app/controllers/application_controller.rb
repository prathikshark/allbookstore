class ApplicationController < ActionController::Base
        before_action :configure_permitted_parameters, if: :devise_controller?

        private
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :phone])
        end
        def after_sign_in_path_for(resource)
            if resource.is_a?(User) && resource.isadmin?
              admin_path
            else
              root_path
            end
          end
      
end

