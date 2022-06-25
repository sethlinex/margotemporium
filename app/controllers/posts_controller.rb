class PostsController < ApplicationController
    def index
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new 
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            flash[:notice] = "This Margot has been added!"
            redirect_to @post
        else
        end
    end

    private

    def post_params
        params.require(:post).permit(:name, :image)
    end
end
