class StaticController < ApplicationController
  skip_filter :authenticate_user!

  def index
    redirect_to admin_posts_path if current_user
  end
end
