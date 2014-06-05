class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end


  def additional_info
    @user = User.find params[:id]
  end


  def update
    @user =  User.find(params[:id])
    if @user.update(user_addinfo)
         redirect_to @user
    else
	 render action: 'additional_info'
    end
  end


  def create
     @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      redirect_to  additional_info_path(@user)
      flash[:success] = "Welcome to InYourShoes!"
     else
       render'new'
     end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    def user_addinfo
      params.require(:user).permit(:years_business, :years_relationships, :years_careers, :years_lifeoutlook)
    end
end
