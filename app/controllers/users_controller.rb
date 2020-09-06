class UsersController < ApplicationController

before_action :authenticate_user!#ログインユーザーのみ

def index
  @book = Book.new #Newbookフォーム
  @users = User.all
  @user = current_user #user infoでname,introductionを表示する為
end

def show
  @book = Book.new #Newbookフォーム
  @user = User.find(params[:id]) #user infoでname,introductionを表示する為[ユーザーごと]
  @books = @user.books  #@userに紐付いたbooksテーブル
end

def edit
  @user = User.find(params[:id]) #user編集フォーム

  if @user.id != current_user.id
     redirect_to user_path(current_user)
  end

end

def update
  @user = User.find(params[:id]) #user編集フォーム

  if @user.update(user_params)
     flash[:notice]="You have updated user successfully."
     redirect_to user_path(current_user)

  else
  	render :edit

  end

end

private
def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)
end

end
