Rails.application.routes.draw do
  resources :cats do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  root 'pages#home'
end
