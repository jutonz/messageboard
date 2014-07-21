class SessionsController < ApplicationController

  def new
    @user = User.new
    @disable_nav = true;
  end

  def create
    @user = User.find_by! email: user_params[:email]
    if @user.authenticate user_params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    end

  end

  def destroy
    if current_user 
      session.delete :user_id
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
