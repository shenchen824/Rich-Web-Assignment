class CommentsController < ApplicationController
	def create
	  #get the post which is the parent of this comment
	  @post = Post.find(params[:post_id])
	  #get the comment
	  @comment = @post.comments.build(params[:comment])
	  #set the current login user as the owner of comment
	  @comment.user_id = current_user.id
	  if @comment.save
	  	#when the comment create successfully, the page will redirect to post page
	    redirect_to @post
	  else
	    render "posts/show"
	  end
	end

	#Delete the comment record and then page is retruned to the previous one
	def destroy
       @comment = Comment.find(params[:id])
	   if @comment.destroy
	      redirect_to :back
	  end
    end
end