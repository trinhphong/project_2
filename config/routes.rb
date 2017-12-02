Rails.application.routes.draw do
  resources :chinese_phrases
  resources :chinese_posts
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
  Rails.application.routes.draw do
    devise_for :admins, controllers: {
      sessions: 'admins/sessions'
    }
  end
  
  get '/admins/sign_up', to: redirect('/admins/sign_in')

end