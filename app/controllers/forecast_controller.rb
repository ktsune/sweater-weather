class ForecastController < ApplicationController
  def index
    facade = ForecastFacade.new(*params[:location].split(','))
    render json: ForecastSerializer.new(facade.forecast)
  end
end
