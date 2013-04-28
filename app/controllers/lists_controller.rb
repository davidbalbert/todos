class ListsController < ApplicationController
  def index
    @lists = List.all
    @new_list = List.new
  end

  def show
    @list = List.find(params[:id])
    @new_todo = @list.todos.build
  end

  def create
    @list = List.new(list_params)

    if @list.save
      respond_to do |format|
        format.html do
          flash[:success] = "New list created!"
          redirect_to root_url
        end

        format.js do
          @new_list = List.new
          @lists = List.all
        end
      end
    else
      @new_list = @list

      respond_to do |format|
        format.html do
          @lists = List.all
          flash.now[:error] = "I couldn't make your list :("
          render :index
        end

        format.js do
          @lists = List.all
        end
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js { @lists = List.all }
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
