class PostsController < ApplicationController
  skip_filter :authenticate_user!

  def index
    @posts = Post.all
    @blog = current_user.blog
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @blog = current_user.blog
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


end
