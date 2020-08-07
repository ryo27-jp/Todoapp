class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    todo.save!
    redirect_to todos_url, notice: "Todo「#{todo.name}」を登録しました。"
  end

  def edit
  end

  private
    
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
end
