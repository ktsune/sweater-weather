Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'weather#index'
  get '/api/v1/forecast', to: 'forecast#index'
  get '/api/v1/gifs', to: 'gif#index'
  get '/api/v1/antipode', to: 'antipode#index'
end
