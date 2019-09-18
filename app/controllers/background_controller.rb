class BackgroundController < ApplicationController
  def index
    render json: UnsplashSerializer.new(Unsplash.new(*params[:location].split(',')))
  end
end
