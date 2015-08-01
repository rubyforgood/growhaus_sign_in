Rails.application.routes.draw do
  scope '(:locale)', :locale => /en|es/ do
    get 'login' => 'pages#login'
    get 'welcome' => 'pages#welcome'
    resources :users do
      resources :activity_sessions, only: :index
      resources :activities, only: :index
    end
  end

  get '/:locale' => 'pages#welcome'
end
