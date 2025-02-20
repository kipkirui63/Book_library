require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "test@example.com", password: "password")
    @book = Book.create(title: "1984", author: "George Orwell", isbn: "1234567891")
    @borrowing = Borrowing.new(user: @user, book: @book, due_date: 2.weeks.from_now)
  end

  test "should be valid with all attributes" do
    assert @borrowing.valid?
  end

  test "should require a user" do
    @borrowing.user = nil
    assert_not @borrowing.valid?
  end

  test "should require a book" do
    @borrowing.book = nil
    assert_not @borrowing.valid?
  end

  test "should have a due date" do
    borrowing = Borrowing.new(book: books(:one), user: users(:one))
    
    assert_not borrowing.valid?, "Borrowing should be invalid without a due date"
    assert_includes borrowing.errors[:due_date], "can't be blank"
  
    borrowing.due_date = Date.today + 7.days
    assert borrowing.valid?, "Borrowing should be valid with a due date"
  end
  
  
end
