Rails.application.routes.draw do
  get 'homepage/home'
  resources :panjabi_words
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#home'
end
