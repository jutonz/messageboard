class UsersController < ApplicationController
  def new
    @user = User.new
    # @disable_nav = true;
  end

  def edit
    user = User.find params[:id]
    if can? :update, user
      @user = user
    end
  end

  def update
    @user = User.find params[:id]
    if @user.authenticate edit_params[:password_old]
      if @user.update user_params
        redirect_to root_url
      else
        render 'users/edit'
      end
    else
      flash[:notice] = 'Incorrect current password'
      render 'users/edit'
    end
    @password_old = params[:password_old]
    # @user.display_name = user_params[:display_name]
    # @user.email = user_params[:email]
    # if @user.authenticate(params[:password_old])
    #   @user.password = user_params[:password]
    #   @user.password_confirmation = user_params[:password_confirmation]
    #   if @user.save
    #     redirect_to root_url
    #   else
    #     render 'users/edit'
    #   end
    # else 
    #   # Incorrect old password
    # end
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

  def edit_params
    params.require(:user).permit(:display_name, :email, :password, :password_confirmation, :password_old)
  end
end
