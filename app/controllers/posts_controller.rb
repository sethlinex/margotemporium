class PostsController < ApplicationController
    before_action :set_post, only: %i(show)

    def index
        @posts = Post.all
    end

    def show
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
