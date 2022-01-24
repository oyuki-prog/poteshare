class UsersController < ApplicationController
  def edit
      @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(params.require(:user).permit(:name, :introduction, :avatar))
      flash[:notice] = 'ユーザー情報を更新しました'
      redirect_to :users_profile
    else
      flash[:error] = @user.errors.full_messages
      redirect_to :users_profile
    end
  end
end
