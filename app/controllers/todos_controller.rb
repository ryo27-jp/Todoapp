class TodosController < ApplicationController
  skip_before_action :editor_required, only: [:index, :show]
  before_action :set_todo, only: [:edit, :update, :destroy]

  def index
    if viewer_user
      @q = viewer_user.editor.todos.ransack(params[:q])
      @todos = @q.result(distinct: true)
    else
      @q = current_user.todos.ransack(params[:q])
      @todos = @q.result(distinct: true)
    end
  end

  def show
    if viewer_user
      @todo = viewer_user.editor.todos.find(params[:id])
    else
      @todo = current_user.todos.find(params[:id])
    end
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(todo_params)

    if @todo.save
    redirect_to @todo, notice: "Todo「#{@todo.name}」を登録しました。"      
    else
      render :new
    end    
  end

  def edit
  end

  def update
    @todo.update!(todo_params)
    redirect_to todos_url, notice: "Todo「#{@todo.name}」を編集しました。"
  end

  def destroy
    @todo.destroy
    redirect_to todos_url, notice: "Todo「#{@todo.name}」を削除しました。"
  end

  private
    
    def todo_params
      params.require(:todo).permit(:name, :description, :category_id)
    end
    
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end
end
