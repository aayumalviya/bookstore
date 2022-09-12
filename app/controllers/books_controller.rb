class BooksController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @book =  current_user.books
    # @books = Book.with_long_title
  end

  def show 
    @user = User.find(params[:user_id])
    @book = Book.find(params[:id])
  end 

  def new
    @user = User.find(params[:user_id])
    @book = @user.books.new
  end

  def create 
    @user = User.find(params[:user_id])
    @book = @user.books.new(book_params)
      respond_to do |format|
      format.js do
        if @book.save 
          flash.now[:notice] = "Book Created"
        else
          flash.now[:error] = @book.errors.full_messages.to_sentence
        end
      end
    end
  end

  private 

  def book_params
    params.require(:book).permit(:title, :book_pdf, :book_image)
  end
end
