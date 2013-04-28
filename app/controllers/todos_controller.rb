class TodosController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.build(todo_params)

    if @todo.save
      @new_todo = @list.todos.build

      respond_to do |format|
        format.html do
          flash[:success] = "Todo created!"
          redirect_to @list
        end

        format.js
      end
    else
      @new_todo = @todo

      respond_to do |format|
        format.html do
          flash.now[:error] = "There was an error creating your todo :("
          render 'lists/show'
        end

        format.js
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
