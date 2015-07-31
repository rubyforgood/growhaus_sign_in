Rails.application.routes.draw do
  get 'welcome' => 'pages#welcome'  
  get "login"   => "pages#login"
end
