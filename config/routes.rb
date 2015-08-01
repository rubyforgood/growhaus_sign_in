Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|es/ do
    get "login" => "pages#login"
    get "welcome" => "pages#welcome"
    resources :users
  end

  get '/:locale' => "pages#welcome"
end
