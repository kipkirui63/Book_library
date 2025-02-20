class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow, :return]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book added successfully."
    else
      render :new
    end
  end

  def borrow
    book = Book.find(params[:id])

    if book.available?
      Borrowing.create!(user: current_user, book: book, due_date: 2.weeks.from_now)
      redirect_to books_path, notice: "You have borrowed #{book.title}."
    else
      redirect_to books_path, alert: "This book is already borrowed."
    end
  end

  def return
    borrowing = current_user.borrowings.find_by(book_id: params[:id], returned_at: nil)

    if borrowing
      borrowing.update!(returned_at: Time.current)
      redirect_to profile_path, notice: "Book returned successfully."
    else
      redirect_to profile_path, alert: "You haven't borrowed this book."
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
