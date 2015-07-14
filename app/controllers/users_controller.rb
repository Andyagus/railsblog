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
         @user = User.all

         if User.find_by(params[:user])
           flash[:alert] = "This user exists already"
           redirect_to new_user_path
         elsif
           params[:user][:password] == params[:password_confirmation]
           @user = User.create params[:user]
           flash[:alert] = "#{@user.username} has been signed up"
           redirect_to users_path
         else
           flash[:alert] = "Your password did not match confirmation"
           redirect_to new_user_path
         end
   end

   def show
      @user= User.find params[:id]
      @post = Post.all
   end

   def update
      @user = current_user.update params[:user]
      redirect_to user_path
   end

   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
