class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if current_user.id == @user.id
      if
        @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render "edit"
      end
    else
      redirect_to root_path
    end
  end

  def show
    @tweets = @user.tweets.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
