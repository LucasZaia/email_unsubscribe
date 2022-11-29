require "test_helper"

class EmailListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_list = email_lists(:one)
  end

  test "should get index" do
    get email_lists_url, as: :json
    assert_response :success
  end

  test "should create email_list" do
    assert_difference("EmailList.count") do
      post email_lists_url, params: { email_list: { email: @email_list.email } }, as: :json
    end

    assert_response :created
  end

  test "should show email_list" do
    get email_list_url(@email_list), as: :json
    assert_response :success
  end

  test "should update email_list" do
    patch email_list_url(@email_list), params: { email_list: { email: @email_list.email } }, as: :json
    assert_response :success
  end

  test "should destroy email_list" do
    assert_difference("EmailList.count", -1) do
      delete email_list_url(@email_list), as: :json
    end

    assert_response :no_content
  end
end
