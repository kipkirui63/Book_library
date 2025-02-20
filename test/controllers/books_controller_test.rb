require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Include Devise test helpers

  setup do
    @user = users(:one) # Load test user from fixtures
    sign_in @user # Sign in the user before tests
    @book = books(:one) # Load a test book fixture
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should show book details" do
    get book_url(@book)
    assert_response :success
  end
end
