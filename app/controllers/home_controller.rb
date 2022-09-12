class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    
    @books = Book.all
  end

 def dashboard
   shares = Share.where(user_id: current_user.id)
   book_ids = shares.pluck(:book_id)
   @books = Book.where(id: book_ids)
  end
end
