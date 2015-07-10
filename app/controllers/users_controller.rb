class UsersController < ApplicationController

   def index
      @user = User.all
   end

   def edit
      @user = User.find params[:id]
   end

   def new 
      @user = User.new
   end   

   def create
      @user = User.create params[:user]
      @age = params[:age].to_i
      birthday = @age.years.ago
      @user.birthday = birthday
      @user.save
      session[:user_id] = @user.id
      flash[:alert] = "Just created new user!"
      redirect_to root_path
   end

   def show
      @user= User.find params[:id]
      @post = Post.all
   end

   def update
      @user = current_user.update params[:user]
      redirect_to user_path
   end
end
