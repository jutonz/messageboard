class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

	def new
		@post = current_user.posts.build
	end

	def create
	  @post = current_user.posts.build post_params
	  @post.save
	  redirect_to posts_path
	end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

	private

	def post_params
    params.require(:post).permit(:title, :contents)
	end
end
