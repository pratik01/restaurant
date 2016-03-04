class RegistrationsController < Devise::RegistrationsController

  def create
    if params[:role].blank?
      @role = Role.find_by_name("customer")
      params[:user][:role_id] = @role.id
    elsif params[:role] == "owner"
      @role = Role.find_by_name("owner")
      params[:user][:role_id] = @role.id
    elsif params[:role] == "admin"
      @role = Role.find_by_name("admin")
      params[:user][:role_id] = @role.id
    else
      @role = Role.find_by_name("customer")
      params[:user][:role_id] = @role.id
    end
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  private

  def sign_up_params
    params.require(resource_name).permit!
  end
end
