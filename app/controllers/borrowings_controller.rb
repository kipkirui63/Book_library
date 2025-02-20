class BorrowingsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      book = Book.find(params[:borrowing][:book_id])
      borrowing = Borrowing.new(user: current_user, book: book, due_date: params[:borrowing][:due_date])
  
      if borrowing.save
        redirect_to books_path, notice: "Book borrowed successfully."
      else
        redirect_to books_path, alert: "Failed to borrow book."
      end
    end
  
    def destroy
      borrowing = Borrowing.find(params[:id])
  
      if borrowing.destroy
        redirect_to books_path, notice: "Book returned successfully."
      else
        redirect_to books_path, alert: "Failed to return book."
      end
    end
  end
  