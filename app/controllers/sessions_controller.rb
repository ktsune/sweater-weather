class SessionsController < ApplicationController
  def create
    return not_authorized_error if !params[:email]
    binding.pry
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render status: :OK, json: { api_key: user.api_key }
    else
      not_authorized_error
    end
  end

private

  def not_authorized_error
    render status: :unauthorized, json: { error: 'Re-enter your username and password' }
  end
end
