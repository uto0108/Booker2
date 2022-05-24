class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  before_action :ensure_current_user, {only: [:edit, :update]}
  def ensure_current_user
    @user =User.find(params[:id])
    if @user.id == current_user.id
    else
      redirect_to user_path(@current_user.id)
    end
  end

  private
def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end


end
