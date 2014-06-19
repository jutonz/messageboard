class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new 
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.save
		redirect_to post_path(Post.find { |post| post.id == @comment.post_id })
	end

	private 

	def comment_params
		params.require(:comment).permit(:post_id, :contents)
	end
end
