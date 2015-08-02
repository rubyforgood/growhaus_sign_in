Rails.application.routes.draw do
  resources :staffs

  scope '(:locale)', locale: /en|es/ do
    get 'login' => 'pages#login'
    get 'welcome' => 'pages#welcome'

    get 'users/new_role' => 'users#new_role'
    resources :users do
      resources :activity_sessions, only: :index
      resources :activities, only: :index
    end

    resources :activity_sessions, only: %i[ create update ]
  end

  get '/:locale' => 'pages#welcome'
end
