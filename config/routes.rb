Rails.application.routes.draw do
  get "login" => "pages#login"
  get "welcome" => "pages#welcome"
end
