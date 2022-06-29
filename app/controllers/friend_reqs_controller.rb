

class FriendReqsController < ApplicationController
    def index
    
    end

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

    def show 
        @user = current_user
        @current_reqs = FriendReq.where(to_user_id: current_user.id)
        if @current_reqs == []
            flash[:notice] = "You have no request"
            redirect_to root_path
        end
    end

    def accept
        # binding.pry
        @friend_req = FriendReq.find(params[:req_id])
        @sender = @friend_req.from_user
        @current_user = current_user
        if @friend_req.to_user == current_user
            @friendship1 = @current_user.friendship.build(friend_id: @sender.id)
            @friendship2 = @sender.friendship.build(friend_id: current_user.id)
            if @friendship1.save && @friendship2.save
                flash[:notice] = "You got a new friend." 
                @friend_req.destroy
            else 
                flash[:error] = "Cannot make friends"
            end
        end
        redirect_back fallback_location: 'show'    
    end

    def reject
        @friend_req = FriendReq.find(params[:req_id])
        if @friend_req.to_user == current_user
            @friend_req.destroy
            flash[:notice] = "You deleted this request."
            redirect_back fallback_location: 'show'
        end
    end
end
