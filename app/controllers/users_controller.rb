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
      flash[:alert] = "Just created new user!"
      redirect_to root_path
   end

   def show
      @user= User.find params[:id]
   end
end
