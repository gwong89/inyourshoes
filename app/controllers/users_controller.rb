class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new 
  end

  
  def additional_info
    @user = User.new(user_addinfo)
    if @user.save
     redirect_to @user
    end
  end


  def create
     @user = User.new(user_params)
     if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      redirect_to  additional_info_path
      flash[:success] = "Welcome to InYourShoes!"
      #return @user  
     else
       render'new'
     end
  end  

  private
    
    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    def user_addinfo
      params.permit(:expertise, :years)
    end
end
