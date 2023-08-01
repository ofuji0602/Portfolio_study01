class MyPagesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show; end
  
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to my_page_path, notice: t('defaults.message.updated')
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
  
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
