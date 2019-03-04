class RegistrationsController < Devise::RegistrationsController
 

  protected

  def after_sign_up_path_for(resource)
    #  destroy_user_session_path, method: :delete
    # "https://www.google.com.au"
    if current_user.is_supplier == true 
    new_business_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
      root_path
  end

  def after_update_path_for(resource)
    if resource.is_supplier == true && resource.business.nil?
      new_business_path
    else
      profile_path
    end
  end

end