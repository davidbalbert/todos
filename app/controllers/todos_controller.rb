class TodosController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.build(todo_params)

    if @todo.save
      flash[:success] = "Todo created!"
      redirect_to @list
    else
      flash.now[:error] = "There was an error creating your todo :("
      render 'lists/show'
    end
  end

  def update
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])

    if @todo.update_attributes(todo_params)
      redirect_to @list
    else
      render 'lists/show'
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])

    @todo.destroy
    redirect_to @list
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :completed)
  end
end
