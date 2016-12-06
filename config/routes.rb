Rails.application.routes.draw do
  root 'surveys#index'

  resources :surveys do
    resources :questions
  end
end
