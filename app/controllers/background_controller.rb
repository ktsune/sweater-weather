class BackgroundController < ApplicationController
  def index
    background_facade = BackgroundFacade.new(*params[:location].split(','))
    render json: UnsplashSerializer.new(background_facade)
  end
end
