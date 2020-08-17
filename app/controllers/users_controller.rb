class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :editor_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = editor_user.viewers
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @user.update!(user_params)
    redirect_to todos_url, notice: "Todo「#{@user.name}」を編集しました。"
  end

  def destroy
    @user.destroy
    redirect_to todos_url, notice: "Todo「#{@user.name}」を削除しました。"
  end


  private
    def user_params
      params.require(:user).permit(:name,:email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
