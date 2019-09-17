class UserController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
