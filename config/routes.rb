Rails.application.routes.draw do
  root :to => "home_page#index"
  resources :home_page
  resources :vietnamese_phrases
  resources :chinese_phrases
  resources :chinese_posts
  Rails.application.routes.draw do
  resources :vietnamese_phrases
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
  Rails.application.routes.draw do
  resources :vietnamese_phrases
    devise_for :admins, controllers: {
      sessions: 'admins/sessions'
    }
  end
  
  get '/admins/sign_up', to: redirect('/admins/sign_in')

end