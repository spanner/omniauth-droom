module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
    def droom
      if @user = User.find_or_create_from_oauth(request.env["omniauth.auth"], current_user)
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "data room") if is_navigational_format?
      end
    end
    
    def failure
      Rails.logger.warn "xxx auth failure! #{request.env['omniauth.error'].inspect}"
      super
    end
  end
  
end