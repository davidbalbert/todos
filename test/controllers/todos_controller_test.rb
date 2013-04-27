require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  test "create a todo" do
    assert_difference("Todo.count") do
      post :create, list_id: lists(:a_list).id, todo: {name: "A todo"}
    end
  end

  test "can't create todo without a name" do
    assert_no_difference("Todo.count") do
      post :create, list_id: lists(:a_list).id, todo: {name: ""}
    end
  end
end
