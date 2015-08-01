Rails.application.routes.draw do
    resources :staffs
  scope "(:locale)", :locale => /en|es/ do
    root "pages#login"
    get "/welcome", to: "pages#welcome"

    get "/auth/:provider/callback", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

  end

  get '/:locale' => "pages#welcome"
end
