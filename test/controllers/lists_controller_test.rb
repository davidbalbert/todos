require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create a list" do
    assert_difference("List.count") do
      post :create, list: {name: "A list"}
    end
  end

  test "shouldn't create a list" do
    assert_no_difference("List.count") do
      post :create, list: {name: ""}
    end
  end
end
