class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @invitation = Invitation.where(:token => params[:token]).first
    super
  end

  def create
    build_resource
    resource.token = params[:token].to_s
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      respond_with resource
    end
  end
  
end