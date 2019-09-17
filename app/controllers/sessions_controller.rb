class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render status: :ok, json: { api_key: @user.api_key }
    else
      render html: 'Wrong email and/or password'
    end
  end
end
