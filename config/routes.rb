Rails.application.routes.draw do
  root :to => "home_page#index"
  resources :home_page
  resources :vietnamese_phrases do
    member do
      post :calculate_score
    end
  end
  resources :chinese_phrases
  resources :chinese_posts

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  get '/admins/sign_up', to: redirect('/admins/sign_in')

end