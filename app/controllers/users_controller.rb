class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @arts = @user.arts
  end
end
