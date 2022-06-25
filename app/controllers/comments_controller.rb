class CommentsController < ApplicationController
    # before_action :comment_params
    def new
        # @post = Post.find(params[:post_id])
    end

    def create
        # binding.pry
        @post = Post.find(params[:commentable_id])
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            flash[:notice] = "You have commented"
            redirect_back post_path(@post)
        else
            flash[:alert] = "Cannot create comment"
        end
    end

    def edit 
        @post = Post.find(params[:post_id])
        render 'posts/show'
    end

    def destroy
        # @post = Post.find(params[:commentable_id])
        # @comment = @post.comments.find(params[:commentable_id])
        @comment = Comment.find(params[:comment_id])
        if @comment.destroy
            redirect_back post_path(@post)
            flash[:notice] = "You have delete this comment."
            redirect_back current_user
        else 
            flash[:error] = "Comment cannot be deleted"
            redirect_back current_user
        end
    end

    def comment_params
        params.permit(:body, :commentable_type, :commentable_id)
      end
end
