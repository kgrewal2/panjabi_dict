Rails.application.routes.draw do
  resources :panjabi_words
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#home'
  get 'homepage/home'
  get 'homepage/profile', :as => 'profile'
  get '/search' => 'panjabi_words#search', :as => 'search_page'
  post '/save_profile' => 'homepage#save_profile', :as => 'save_profile'
  get '/submissions' => 'panjabi_words#submissions', :as => 'submissions'

end
