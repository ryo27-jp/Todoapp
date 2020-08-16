class ViewersController < ApplicationController

  def index
    @viewers = editor_user.viewers
  end

  def new
    @viewer = User.new
  end

  def create
    @viewer = editor_user.viewers.new(viewer_params)

    if @viewer.save
      redirect_to viewer_url(@viewer), notice: "ユーザー「#{@viewer.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private
    def viewer_params
      params.require(:viewer).permit(:name,:email, :password, :password_confirmation)
    end
end

