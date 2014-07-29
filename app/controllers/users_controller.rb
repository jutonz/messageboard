class UsersController < ApplicationController
  def new
    @user = User.new
    # @disable_nav = true;
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render 'users/new'
    end
  end

  def show
    @displayed_user = User.includes(:posts).find_by(id: params[:id].to_f)
    @viewing_own_profile = @displayed_user.id == current_user.id
    @display_name = @displayed_user.display_name
    if @displayed_user != nil
      @user = current_user
      @posts = @displayed_user.posts
      @comments = Comment.where(user_id: @displayed_user.id)
      @commented_posts = @displayed_user.comments
    end
  end

  private
  def user_params
    params.require(:user).permit(:display_name, :email, :password, :password_confirmation)
  end
end
