Rails.application.routes.draw do
  resources :panjabi_words
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#home'
  get 'homepage/home'
  get '/search' => 'panjabi_words#search', :as => 'search_page'
  get '/submissions' => 'panjabi_words#submissions', :as => 'submissions'

end
