class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
    redirect_to @category, notice: "Todo「#{@category.name}」を登録しました。"      
    else
      render :new
    end    
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update!(category_params)
    redirect_to todos_url, notice: "Todo「#{category.name}」を編集しました。"
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to todos_url, notice: "Todo「#{category.name}」を削除しました。"
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
