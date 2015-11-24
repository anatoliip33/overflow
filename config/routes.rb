Rails.application.routes.draw do

  concern :votable do
    post :vote, to: 'votes#vote'
  end

  resources :questions do
    concerns :votable
    resources :answers do
      concerns :votable
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]

  root to: "home#index"
end
