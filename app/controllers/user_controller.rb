class UserController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save && user_params[:password] == user_params[:password_confirmation]
      render status: :created, json: ApiKeySerializer.new(user)
    else
      render status: :bad_request, json: { error: user.errors.full_messages.to_sentence }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
