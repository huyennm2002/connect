class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @post = Post.new
    @users = User.all
    if current_user
      @posts = Post.where('user_id IN (?)', current_user.friend_ids).or(Post.where(user_id: current_user.id))
      
      @random_posts = []
      if @posts.length > 6
        6.times do 
          @random_posts << @posts[rand(@posts.length)]
        end
      else 
        @random_posts = @posts
      end
      @random_users = []
      3.times do 
        @random_users << @users[rand(@users.length)]
      end
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
      # redirect_back fallback_location: @post
      redirect_to post_path(@post)
    else 
      render :edit, status: :unprocessable_entity    
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "You have deleted a post."
    redirect_to current_user
  end

  private
  def post_params
    params.require(:post).permit(:content,  {images: []})
  end
end
