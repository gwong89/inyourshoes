class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new 
  end

  
  def additional_info
    @user = User.new
  end


  def create
     @user = User.new(user_params)
     if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      redirect_to users: 'additional_info' 
      flash[:success] = "Welcome to InYourShoes!"
      return @user  
     else
       render'new'
     end
  end  

  private
    
    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
