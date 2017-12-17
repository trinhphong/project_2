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
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }

  resources :users do
    post :generate_new_password_email
  end

  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  
  get '/admins/sign_up', to: redirect('/admins/sign_in')

end