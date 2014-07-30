class CommentsController < ApplicationController
	
	before_action :find_post

	def index
		@comments = @post.comments
	end

	def new 
		@comment = @post.comments.build
	end

	def edit
		@comment = @post.comments.find(params[:id])
	end

	def update
		@comment = @post.comments.find params[:id]
		@comment.contents = comment_params[:contents]
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'comments/edit'
		end
	end

	def create
		@comment = @post.comments.build comment_params
		@comment.user = current_user
		if @comment.save
		  redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def destroy
		if can? :destroy, @comment
			comment = @post.comments.find_by id: params[:id]
			comment.try :destroy
		end
		redirect_to post_path(@post)
	end

	private 
	def comment_params
		params.require(:comment).permit(:contents)
	end

	def find_post
		@post = Post.find_by! id: params[:post_id]
	end
end
