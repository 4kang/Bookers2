class UsersController < ApplicationController
  def index
    @user = current_user
    @new_book = Book.new
    @users = User.all
    @books = @user.books
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :password, :password_confirmation)
  end

end
