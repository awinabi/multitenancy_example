class Post < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :blog
  has_many :comments
end
