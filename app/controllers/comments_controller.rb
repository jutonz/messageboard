class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new 
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(post_params)
		@comment.save
		redirect_to comments_path
	end

	private 

	def comment_params
		params.require(:comment).permit(:name)
	end
end
