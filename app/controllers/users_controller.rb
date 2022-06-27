class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:index, :destroy]
  
  def index
    @user = User.all 
    @current_user = current_user
  end

  # def create 
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:success] = "Welcome"
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "failed to save"
  #   end
  # end
  


  def search 
      @searched_users = User.search_users(params[:key])
      if @searched_users != nil 
        flash[:notice] = "Found your users"
      else 
        flash[:error] = "No users found"
      end
  end

  def show
    @current_user = current_user
    @type_post = 'Post'
    @type_comment = 'Comment'
    @current_request = current_user.sent_reqs.all
    if params[:id]
      @user = User.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
      end
    else 
      @user = current_user
    end
  end 
  
  def likes
    @user = User.find(params[:user_id])
    liked_posts_ids = LIke.where(user_id: @user.id, likable_type: "Post").pluck(:likable_id)
    # @posts = Post.where('id IN (?)', liked_posts_id).includes(:likes, comments: :comments, :user)
  end
    
  def edit
    @user = current_user
  end

  def update 
    current_user.update(user_params)
    respond_to current_user
  end


  private  
  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :education, :location, :avatar)
  end
end
