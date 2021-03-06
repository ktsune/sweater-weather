Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/v1/forecast', to: 'forecast#index'
  get '/api/v1/background', to: 'background#index'
  post '/api/v1/users', to: 'user#create'
  post '/api/v1/sessions', to: 'sessions#create'
end
