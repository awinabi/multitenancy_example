class Devise::Custom::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_tenant!

  def new
    super # no customization, simply call the devise implementation
  end

  def create
    sign_out_session!
    Tenant.transaction  do 
      @tenant = Tenant.create_new_tenant(params)
      if @tenant.errors.empty?   # tenant created
        initiate_tenant( @tenant )    # first time stuff for new tenant
        devise_create   # devise resource(user) creation; sets resource
        if resource.errors.empty?   #  SUCCESS!
          # do any needed tenant initial setup
          Tenant.tenant_signup(resource, @tenant, params[:coupon])
        else  # user creation failed; force tenant rollback
          raise ActiveRecord::Rollback   # force the tenant transaction to be rolled back  
        end  # if..then..else for valid user creation
      else
        prep_signup_view( @tenant, params[:user] , params[:coupon])
        render :new
      end # if .. then .. else no tenant errors
    end  #  wrap tenant/user creation in a transaction
  end

  def update
    super # no customization, simply call the devise implementation 
  end

  protected

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_user_session_path
  end


  private

# ------------------------------------------------------------------------------
# sign_out_session! -- force the devise session signout
# ------------------------------------------------------------------------------
  def sign_out_session!()
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name) if user_signed_in?
  end

# ------------------------------------------------------------------------------
# devise_create -- duplicate of Devise::RegistrationsController
# same as in devise gem EXCEPT need to prep signup form variables
# ------------------------------------------------------------------------------
  def devise_create
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else  # resource had errors ...
      prep_devise_new_view( @tenant, resource )
    end
  end

# ------------------------------------------------------------------------------
# prep_devise_new_view -- common code to prep for another go at the signup form
# ------------------------------------------------------------------------------
  def prep_devise_new_view( tenant, resource )
    clean_up_passwords(resource)
    prep_signup_view( tenant, resource, params[:coupon] )   # PUNDA special addition
    respond_with_navigational(resource) { render_with_scope :new }
  end
  

end