

class FriendReqsController < ApplicationController
    def create 
        # binding.pry
        friend_req = FriendReq.new(from_user_id: current_user.id, to_user_id: params[:id])
        if friend_req.save
            flash[:notice] = "Your friend request was successfully sent!"
            redirect_back fallback_location: user_path(current_user)
        else
            flash[:error] = "Unable to add this friend."
            redirect_back fallback_location: user_path(current_user)
        end

    end

    def accept
        @friend_req = FriendReq.find(params[:id])
        if @friend_req.to_user == current_user
            current_user.friends << @friend_req.from_user
            @friend_req.destroy
            flash[:notice] = "You got a new friend."
        else 
            
        end            
    end

    def reject
        @friend_req = FriendReq.find(params[:id])
        if @friend_req.to_user == current_user
            @friend_req.destroy
            flash[:notice] = "You deleted this request."
        end
    end
end
