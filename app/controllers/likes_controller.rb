class LikesController < ApplicationController
    def new
       like = Like.new
    end

    def create 
        # binding.pry
        if like_params[:user_id].to_i == current_user.id 
            like = Like.create(like_params)
            flash[:notice] = "You have liked this post."        
            redirect_back fallback_location: root_path
        end
    end

    def destroy 
        like = Like.find(params[:id_like])
        like.destroy if like.user == current_user
        flash[:notice] = "Unliked"        
        redirect_back fallback_location: root_path
    end

    private
    def like_params
        params.require(:like).permit(:user_id, :likable_id, :likable_type)
    end
end
    