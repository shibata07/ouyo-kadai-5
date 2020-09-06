class BooksController < ApplicationController

before_action :authenticate_user!#ログインユーザーのみ

def index
  @book = Book.new #Newbookフォーム
  @user = current_user #user infoでname,introductionを表示する為
  @books = Book.all
end

def create
  @book = Book.new(books_params) #新規登録用
  @book.user_id = current_user.id #フォームではid情報がない為

  if @book.save
  	flash[:notice]='You have creatad book successfully'
     redirect_to book_path(@book)

  else
  	@books = Book.all #indexアクション経由しない為
    @user = current_user #indexアクション経由しない為
    render :index

  end

end

def show
  @book = Book.new
  @book_detail = Book.find(params[:id])
  @book_comment = BookComment.new
  @user = @book_detail.user #user infoでname,introductionを表示する為 ユーザーごと
end

def edit
  @book = Book.find(params[:id]) #編集フォーム用

  if @book.user_id == current_user.id
     render "edit"

  else
     redirect_to books_path

  end

end

def update
  @book = Book.find(params[:id])

  if @book.update(books_params)
  	flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book)

  else
  render :edit

  end

end

def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
end

private
def books_params
  params.require(:book).permit(:title, :body)
end

end
