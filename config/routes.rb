Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/show' => 'guest#show'
  get '/show' => 'guest#show'
  root 'guest#index'
end
