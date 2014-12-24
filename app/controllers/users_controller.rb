class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    respond_to do |format|
        format.html # show.html.erb
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:login, :avatar, :email, :birthday, :country, :city, :address)
  end

end
