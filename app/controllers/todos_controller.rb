class TodosController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.build(todo_params)

    if @todo.save
      respond_to do |format|
        format.html do
          flash[:success] = "Todo created!"
          redirect_to @list
        end

        format.js { @new_todo = @list.todos.build }
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:error] = "There was an error creating your todo :("
          render 'lists/show'
        end

        format.js { @new_todo = @todo }
      end
    end
  end

  def update
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])

    if @todo.update_attributes(todo_params)
      respond_to do |format|
        format.html { redirect_to @list }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'lists/show' }
        format.js
      end
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @todo = @list.todos.find(params[:id])

    @todo.destroy

    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :completed)
  end
end
