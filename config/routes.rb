Rails.application.routes.draw do
  resources :cats, only: %i(index) do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  root 'pages#home'
end
