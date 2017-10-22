class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post, only: [:edit, :destroy, :update]
  def edit
  end

  def update
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.post.build(post_params)
  	if @post.save
  		redirect_to root_to
  	else
  		render 'new'
  	end
  end

  def destroy
  end

  private
  def post_params
  	params.require(:post).premite(:user_id, :title, :body)
  end

  def set_post
  	@post = Post.find(params [:id])
  end

end
