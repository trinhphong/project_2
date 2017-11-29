Rails.application.routes.draw do
  resources :chinese_phrases
  resources :chinese_posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
