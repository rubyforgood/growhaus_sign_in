Rails.application.routes.draw do
  resources :staffs

  scope '(:locale)', :locale => /en|es/ do
    root "pages#login"

    get 'login' => 'pages#login'
    get 'welcome' => 'pages#welcome'

    get "/auth/:provider/callback", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    get 'users/new_role' => 'users#new_role'
    resources :users do
      resources :activity_sessions, only: :index
      resources :activities, only: :index
    end

    resources :activity_sessions, only: %i[ create update ]
  end

  get '/:locale' => 'pages#welcome'
end
