class CategoriesController < ApplicationController
  skip_before_action :editor_required, only: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  

  def index
    if viewer_user
      @categories = viewer_user.editor.categories
    else
      @categories = current_user.categories
    end
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
    redirect_to @category, notice: "Todo「#{@category.name}」を登録しました。"      
    else
      render :new
    end    
  end

  def edit
  end

  def update
    @category.update!(category_params)
    redirect_to todos_url, notice: "カテゴリ「#{category.name}」を編集しました。"
  end

  def destroy
    @category.destroy
    redirect_to todos_url, notice: "カテゴリ「#{@category.name}」を削除しました。"
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = current_user.categories.find(params[:id])
    end

end
