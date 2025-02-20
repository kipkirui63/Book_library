class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @borrowed_books = @user.borrowings.where(returned_at: nil)
  end

  def return
    @borrowing = Borrowing.find(params[:id])
    @borrowing.update(returned_at: Time.current)
    redirect_to profile_path, notice: "Book returned successfully."
  end
end