Rails.application.routes.draw do
  devise_for :administrators
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace "api" do
    namespace "v1" do

      scope "members" do
        get "index", to: "members#index"
        get "indexPagination/:page", to: "members#index_pagination"
        get "show/:id", to: "members#show"
        post "create", to: "members#create"
        patch "update", to: "members#update"
        delete "delete/:id", to: "members#delete"
      end

      scope "offices" do
        get "index", to: "offices#index"
        get "indexPagination/:page", to: "offices#index_pagination"
        get "show/:id", to: "offices#show"
        post "create", to: "offices#create"
        patch "update", to: "offices#update"
        delete "delete/:id", to: "offices#delete"
      end

      scope "services" do
        get "index", to: "services#index"
        get "indexPagination/:page", to: "services#index_pagination"
        get "show/:id", to: "services#show"
        post "create", to: "services#create"
        patch "update", to: "services#update"
        delete "delete/:id", to: "services#delete"
      end

      scope "partnerships" do
        get "index", to: "partnerships#index"
        get "indexPagination/:page", to: "partnerships#index_pagination"
        get "show/:id", to: "partnerships#show"
        post "create", to: "partnerships#create"
        patch "update", to: "partnerships#update"
        delete "delete/:id", to: "partnerships#delete"
      end

      scope "projects" do
        get "index", to: "projects#index"
        get "indexPagination/:page", to: "projects#index_pagination"
        get "show/:id", to: "projects#show"
        post "create", to: "projects#create"
        patch "update", to: "projects#update"
        delete "delete/:id", to: "projects#delete"
      end

      scope "administrators" do
        get "index", to: "administrators#index"
        get "show/:id", to: "administrators#show"
        post "create", to: "administrators#create"
        patch "update", to: "administrators#update"
        delete "delete/:id", to: "administrators#delete"
      end
    end
  end
end
