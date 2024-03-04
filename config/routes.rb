Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions'
  }

  devise_scope :admin do
    get "dashboard" , :to => "dashboard#index"
    get "dashboard/login", :to => "admins/sessions#new"
    post "dashboard/login", :to => "admins/sessions#create"
    delete "dashboard/logout", :to => "admins/sessions#destroy"
  end

  namespace :dashboard do
    resources :users, only: [:index,:update,:destroy]
  end

  get "dashboard", :to => "dashboard#index"
  
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]

    collection do
      get 'search_result'
    end
  end

  post 'posts/confirm'
  post 'posts/back'
  post 'posts/save'


  resources :tasks
  
  get 'maps/index', :to => 'maps#index'
  resources :maps, only: [:index]

  
  
  resources :notifications, only: :index      

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }
  get '/users/:id', to: 'users#show', as: 'user'

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end

  resources :user, only: [:edit, :update] do
    collection do 
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      get "mypage/address/edit", :to => "users#edit_address"
      get "mypage/color_picker", :to => "users#color_picker"
      get "mypage/search_results", :to => "users#search_results"
      put "mypage", :to => "users#update"
      delete "mypage/delete" , :to => "users#destroy"
    end
  end
  

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
