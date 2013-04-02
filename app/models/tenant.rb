class Tenant < ActiveRecord::Base
  acts_as_universal_and_determines_tenant
  attr_accessible :name

  def self.create_new_tenant(params)
    return Tenant.create()
  end  
  
  def self.tenant_signup(user, tenant, other = nil)
    # do any needed tenant initial setup
  end
end
