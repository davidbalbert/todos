require 'test_helper'

class ListsControllerTest < ActionController::TestCase
  test "get index" do
    get :index
    assert_response :success
  end

  test "get show" do
    get :show, id: lists(:a_list).id
    assert_response :success
  end

  test "should create a list" do
    assert_difference("List.count") do
      post :create, list: {name: "A list"}
    end
  end

  test "can't create a list without a name" do
    assert_no_difference("List.count") do
      post :create, list: {name: ""}
    end
  end
end
