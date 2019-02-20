Rails.application.routes.draw do
  # For sessions
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  # For Commuter / User
  get '/signup', to: 'commuters#new', as: 'signup'
  get '/commuters/:id', to:'commuters#show', as: 'commuter'
  post '/signup', to:'commuter#create', as: 'create_commuter'
  resources :transit_stops
  resources :transit_lines
  root 'static_pages#home'
  resources :favorites
  # For FRG Editing
  patch '/favorites/:id/remove_favorite/:remove_id/', to: 'favorites#removal', as: 'remove_transit_line'
  patch '/favorites/:id/add_favorite/:add_id/', to: 'favorites#addition', as: 'add_transit_line'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
