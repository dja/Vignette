Vignette::Application.routes.draw do
  
  root 'home#index'
  resources :sessions, :customers, :photographers, :users, :invitations

  get 'customers/:id', to: 'customers#show'
  get 'photographers/:id', to: 'photographers#show'

  get '/signup/:invitation_token', to: 'users#new', as: 'signup'
  # get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  # OmniAuth Stuff
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
