Rails.application.routes.draw do
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
  resources :comments
  
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "verify", :to => "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end

  resource :user, only: [:edit, :update] do
    collection do 
      get "mypage", :to => "users#mypage"
      get "mypage/edit", :to => "users#edit"
      get "mypage/address/edit", :to => "users#edit_address"
      put "mypage", :to => "users#update"
      delete "mypage/delete" , :to => "users#destroy"
    end
  end
  

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
