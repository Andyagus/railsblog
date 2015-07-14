class UsersController < ApplicationController
   
   def index
      @user = User.all
   end



   def new 
    @user = User.new
   end   

   def create
         @user = User.new

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

   
   def edit
      @user = User.find params[:id]
   end


   def update
    @user = User.find params[:id]
    @up = user_params
      if user_params[:password].blank?
       @up.delete(:password)
       @up.delete(:password_confirmation)
      end
      @user.update! @up 
      flash[:notice] = "Profile updated"
      redirect_to user_path(@user)
      
   end

   def destroy
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:success] = "User deleted"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :password, :password_confirmation, :age, :location )
  end
end
