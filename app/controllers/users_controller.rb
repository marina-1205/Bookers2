class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  @user = User.find(params[:id])
  end

  def create 
    @user = User.create(user_params)
        if @user.save 
        redirect_to users_path 
    　　else 
        render :new 
   　　 end 
  end 

  def index
     @users = User.all
     @book = Book.new
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
