class PostsController < ApplicationController
    before_action :set_post, only: %i(show like unlike)

    def index
        @posts = Post.all
    end

    def show
        @comment = @post.comments.build
    end

    def like
        @post.like_by current_user
        redirect_to @post
    end

    def unlike
        @post.unliked_by current_user
        redirect_to @post
    end

    private

    def set_post
        @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "This Margot does not exist!"
        redirect_to posts_path
    end

    def post_params
        params.require(:post).permit(:name, :image)
    end
end
