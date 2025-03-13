Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  
  get '/bookclub', to: 'users#index'
  get '/view_profile/:id', to: 'users#show'
  post '/signup', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'
  
  namespace :api do
    namespace :v1 do
      resources :books
      resources :meetings
      resources :recommendations
    end
  end
  
end

