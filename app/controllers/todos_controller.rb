class TodosController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.build(todo_params)

    if @todo.save
      flash[:success] = "Todo created!"
      redirect_to list_url(@list)
    else
      flash.now[:error] = "There was an error creating your todo :("
      render 'lists/show'
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name)
  end
end
