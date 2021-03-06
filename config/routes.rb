Rails.application.routes.draw do
  devise_for :userlogins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :postimages
  resources :posttexts
  resources :articles
  
  resource :articles do 
    resources :postimages
    resources :posttexts
  end

  root 'articles#index'
end
