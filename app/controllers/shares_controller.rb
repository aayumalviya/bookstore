class SharesController < ApplicationController
  
  def index
    @shares = Share.all
    
  end
  
  def new 
    @book = Book.find(params[:book_id])
    @share = @book.shares.new
  end

  def create 
    @book = Book.find(params[:book_id])
    @share = @book.shares.new(share_params)
    respond_to do |format|
      format.js do
        if  @share.save
          flash.now[:notice] = "Book shared"
        else
          flash.now[:error] = @share.errors.full_messages.to_sentence
        end
      end
    end
  end

  private 

  def share_params
    params.require(:share).permit(:user_id, :book_id)
  end
end
