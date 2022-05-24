Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:list, :edit, :index, :new, :show, :create, :update, :destroy]
  resources :users, only: [:edit, :show, :update, :new, :index]
  root "homes#top"
  get 'home/about' => 'homes#about'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
