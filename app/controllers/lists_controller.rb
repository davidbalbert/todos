class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @todo = @list.todos.build
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:success] = "New list created!"
      redirect_to root_url
    else
      @lists = List.all
      flash.now[:error] = "I couldn't make your list :("
      render :index
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy

    redirect_to root_url
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
