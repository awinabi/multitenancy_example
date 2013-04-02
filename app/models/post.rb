class Post < ActiveRecord::Base
  acts_as_tenant
  attr_accessible :body, :title
  belongs_to :blog
  has_many :comments
end
