Rails.application.routes.draw do

  resources :questions
  resources :answers
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]

  root to: "home#index"
end
