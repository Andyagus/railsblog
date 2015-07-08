class PostsController < ApplicationController

   def index
      @posts = Post.all
   end   

   def new
      @post = Post.new
   end

   def create
      
      @user = current_user
      @post = current_user.posts.create params[:post]
      flash[:alert] = "Just created your post!"
      redirect_to root_path
   end

end