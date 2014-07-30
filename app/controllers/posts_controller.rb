class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

	def new
		@post = current_user.posts.build
	end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.title = post_params[:title]
    @post.contents = post_params[:contents]
    if @post.save
      redirect_to post_path(@post)
    else
      render 'posts/edit'
    end
  end

	def create
	  @post = current_user.posts.build post_params
	  if @post.save
      redirect_to posts_path
    else
      render 'posts/new'
    end
	end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def destroy
    @post = Post.find params[:id]
    if can? :destroy, @post
      @post.try :destroy
    end
    redirect_to root_url
  end

	private

	def post_params
    params.require(:post).permit(:title, :contents)
	end
end
