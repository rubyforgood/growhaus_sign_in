Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|es/ do
    get "login" => "pages#login"
    get "welcome" => "pages#welcome"
  end

  get '/:locale' => "pages#welcome"
end
