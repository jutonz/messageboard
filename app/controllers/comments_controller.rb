class CommentsController < ApplicationController
	
	before_action :find_post

	def index
		@comments = @post.comments
	end

	def new 
		@comment = @post.comments.build
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
		if current_user.admin?
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
