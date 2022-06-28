class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @post = Post.new
    @posts = Post.where('user_id IN (?)', current_user.friend_ids)
    @users = User.all
    @random_posts = []
    6.times do 
      @random_posts << @posts[rand(@posts.length)]
    end
    if @random_posts.last.nil?
      @random_posts = current_user.posts
    end
    @random_users = []
    3.times do 
      @random_users << @users[rand(@users.length)]
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "You have created a post"
      redirect_back fallback_location:root_path
    else 
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else 
      render :edit, status: :unprocessable_entity    
    end
  end

  def destroy
    @post = Post.find[params[:id]]
    @post.destroy
    redirect_to root_path 
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
