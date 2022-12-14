class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = @user.books
    @books = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end



  def index
    @users = User.all
    @book = Book.new
    @user = User.find(current_user.id)

  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
