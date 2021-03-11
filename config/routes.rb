Rails.application.routes.draw do
  resources :microposts do
    member do
      get "like" => "microposts#vote"
      get "delete" => "microposts#destroy"
    end
    resources :comments, module: :microposts
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :post, only: [:create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :profilepics, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root  'static_pages#home'
  get '/search' => 'users#search', :as => 'search_page'
  # match '/microposts/:id', to: 'microposts#destroy', via: 'get'
  # match '/microposts/:id', to: 'microposts#destroy', via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/profilepics', to: 'static_pages#profilepic', via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/microposts/:id/like', to: 'microposts#vote', via: 'get', xhr: true



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
