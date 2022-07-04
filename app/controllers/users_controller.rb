class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :logged_in_user, only: [:index, :destroy]
  after_action :set_default_avatar
  
  def index
    @user = User.all 
    @current_user = current_user
  end

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
    @post = Post.create
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
  end
    
  def edit
    @user = current_user
  end

  def update  
    if current_user.update(user_params)
      flash[:notice] = "You have uploaded your avatar."
    else 
      flash[:errors] = "Unable to upload your avatar."
    end
    redirect_back fallback_location: current_user
  end

  def remove_avatar 
    current_user.remove_avatar!
    if current_user.save
      flash[:notice] = "You have removed your avatar."
    else 
      flash[:errors] = "Unable to remove avatar"
    end
    redirect_back fallback_location: current_user
  end


  private  
  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :education, :location, :avatar, :remove_avatar)
  end

  def set_default_avatar 
    if !current_user.avatar?
      current_user.avatar = '/home/huyennm/RoR%20Bootcamp/rails/odin-facebook/app/default.jpeg'
      current_user.save!
    end
  end
end
