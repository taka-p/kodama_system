class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_filter :configure_permitted_parameters, if: :devise_controller?

  private

    def after_sign_in_path_for(resource)
      home_index_path
    end

    def check_signed_in
      unless signed_in?
        redirect_to '/'
      end
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :admin
      devise_parameter_sanitizer.for(:account_update) << :admin
    end
end
