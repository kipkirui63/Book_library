require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Fix sign_in issue

  setup do
    @user = users(:one) # Load test user
    sign_in @user # Sign in user
    @book = books(:one) # Load book fixture
  end

  test "should borrow a book" do
    assert_difference('Borrowing.count', 1) do
      post borrowings_url, params: { borrowing: { book_id: @book.id, due_date: Date.today + 7.days } }
    end
    assert_redirected_to books_url
  end

  test "should return a book" do
    borrowing = borrowings(:one)
    assert_difference('Borrowing.count', -1) do
      delete borrowing_url(borrowing)
    end
    assert_redirected_to books_url
  end
end
