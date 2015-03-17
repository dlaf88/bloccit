class CommentsController < ApplicationController
  def create
  
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.new(params.require(:comment).permit(:body))
    @comment.post = @post
    @new_comment = Comment.new

    

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@topic,@post]
    else
      flash[:error] = "Comment failed to save."
    end

   
end
   
  
  def destroy
     
     @post = Post.find(params[:post_id])
     @topic = @post.topic    
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end

end