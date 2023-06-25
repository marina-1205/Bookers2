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
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  
end
