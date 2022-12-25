Rails.application.routes.draw do
  devise_for :users
  resources :project do 
    resources :group
    resources :attachments
    resources :topic do
      resources :messages
    end
  end
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
end
