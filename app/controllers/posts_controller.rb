class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new
    puts "========================"
    puts "Sessions params: #{session[:user_id]}"
    puts "User id params: #{current_user}"
    puts "========================"
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
