class Tenant < ActiveRecord::Base
  acts_as_universal_and_determines_tenant
  attr_accessible :name
end
