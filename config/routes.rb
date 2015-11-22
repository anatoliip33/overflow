Rails.application.routes.draw do

  resources :questions do
    post :rating, to: 'ratings#rating'
    resources :answers do
      post :rating, to: 'ratings#rating'
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]

  root to: "home#index"
end
