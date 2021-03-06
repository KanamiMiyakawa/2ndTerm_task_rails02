class UsersController < ApplicationController
  before_action :fobid_login_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path(@user.id), notice: 'ユーザー登録が完了しました！'
    else
      render :new
    end
  end

  def show
    authenticate_user
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
