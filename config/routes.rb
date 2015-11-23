Rails.application.routes.draw do

  resources :questions do
    member do
      put 'like' => 'questions#upvote'
      put 'unlike' => 'questions#downvote'
    end
    resources :answers do
      resources :ratings
    end
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, :only => [:show]

  root to: "home#index"
end
