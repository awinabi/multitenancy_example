class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :id, :name, :twitter_url, :github_url, :blog
  # attr_accessible :title, :body

  has_one :blog
  accepts_nested_attributes_for :blog
  attr_accessible :blog_attributes

  before_create :create_blog

  def create_blog
    self.blog = Blog.create(:name => 'New Victoria Blog')
  end

end
