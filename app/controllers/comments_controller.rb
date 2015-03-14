class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(params.require(:comment).permit(:body))
    @comment.post = @post
    @new_comment = Comment.new

    

    if @comment.save
      flash[:notice] = "Comment was created."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment failed to save."
    end

   
end

end