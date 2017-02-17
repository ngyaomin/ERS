class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
    if current_user != @post.user
      flash[:notice] = "You do not own this Post!"
      redirect_to posts_path
    end
  end



  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
  @post = Post.find(params[:id])

  if @post.update(post_params)
    redirect_to post_path(@post)
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  if current_user == @post.user
    @post.destroy
  else
    flash[:notice] = "You do not own this Post!"
  end
  redirect_to posts_path
end


  private
  def post_params
    params.require(:post).permit(:subject, :categories, :content)
  end

end
