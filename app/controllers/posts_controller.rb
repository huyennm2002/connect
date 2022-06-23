class PostsController < ApplicationController
  def index
    @posts = Post.all
    @random_posts = []
    6.times do 
      @random_posts << @posts[rand(@posts.length)]
    end
  end
  def show
    @post = Post.find[params[:id]]
  end

  def new
    @post = Article.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else 
      render :new, status: :unprocessable_entity  
    end
  end

  def edit
    @post = Post.find[params[:id]]
  end

  def update
    @post = Post.find[params[:id]]
    if @post.update
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
