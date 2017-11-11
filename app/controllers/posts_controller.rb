class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post, only: [:edit, :destroy, :update, :show]
  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
        @post.destroy
    redirect_to root_path
  end

  def update
    @post.update(post_params)
    redirect_to root_path
    
  end

  def show
    @comments = Postcomment.where(post_id: @post.id)    
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
