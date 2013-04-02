class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authenticate_user!

  before_filter :authenticate_tenant!   # authenticate user and setup tenant

  # ------------------------------------------------------------------------------
  # authenticate_tenant! -- authorization & tenant setup
  # -- authenticates user
  # -- sets current tenant
  # -- sets up app environment for this user
  # ------------------------------------------------------------------------------
  def authenticate_tenant!()

    unless authenticate_user!
      email = ( params.nil? || params[:user].nil?  ?  ""  : " as: " + params[:user][:email] )

      flash[:notice] = "cannot sign you in#{email}; check email/password and try again"

      return false  # abort the before_filter chain
    end

    # user_signed_in? == true also means current_user returns valid user
    raise SecurityError,"*** invalid sign-in  ***" unless user_signed_in?

    set_current_tenant   # relies on current_user being non-nil

    # any application-specific environment set up goes here

    true  # allows before filter chain to continue
  end


end
