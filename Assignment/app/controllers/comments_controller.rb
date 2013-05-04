class CommentsController < ApplicationController
	before_filter :authenticate_user!, :except =>[:show, :index]
	def create
	  @post = Post.find(params[:post_id])
	  @comment = @post.comments.build(params[:comment])
	  @comment.user_id = current_user.id
	  if @comment.save
	    redirect_to @post
	  else
	    render "posts/show"
	  end
	end

	def destroy
       @comment = Comment.find(params[:id])
	   if @comment.destroy
	      redirect_to :back
	  end
    end
end