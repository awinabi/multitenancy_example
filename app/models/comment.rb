class Comment < ActiveRecord::Base
  acts_as_tenant
  attr_accessible :body, :post_id
  belongs_to :post
end
