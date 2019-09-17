class UserController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save!
      render status: :created, json: { api_key: @user.api_key }
    else
      render html: "could not create a user"
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
