class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
    else
      flash[:notice] = "You do not own this Post!"
    end
    redirect_to post_path(@post)
  end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
