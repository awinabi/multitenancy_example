class Blog < ActiveRecord::Base
  acts_as_tenant
  attr_accessible :name
  belongs_to :user

  has_many :posts
end
