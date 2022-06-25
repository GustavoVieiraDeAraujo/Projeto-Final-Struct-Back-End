Rails.application.routes.draw do
  devise_for :administrators, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace "api" do
    namespace "v1" do

      scope "members" do
        get "index", to: "members#index"
        get "index_pagination/:page", to: "members#index_pagination"
        get "show/:id", to: "members#show"
        post "create", to: "members#create"
        post "add_photo/:id", to: "members#add_photo"
        patch "update/:id", to: "members#update"
        delete "delete/:id", to: "members#delete"
      end

      scope "offices" do
        get "index", to: "offices#index"
        get "index_pagination/:page", to: "offices#index_pagination"
        get "show/:id", to: "offices#show"
        post "create", to: "offices#create"
        patch "update/:id", to: "offices#update"
        delete "delete/:id", to: "offices#delete"
      end

      scope "services" do
        get "index", to: "services#index"
        get "index_pagination/:page", to: "services#index_pagination"
        get "show/:id", to: "services#show"
        post "create", to: "services#create"
        post "add_images/:id", to: "services#add_images"
        patch "update/:id", to: "services#update"
        delete "delete/:id", to: "services#delete"
        delete "delete_all_images/:id", to: "services#delete_all_images"
      end

      scope "partnerships" do
        get "index", to: "partnerships#index"
        get "index_pagination/:page", to: "partnerships#index_pagination"
        get "show/:id", to: "partnerships#show"
        post "create", to: "partnerships#create"
        post "add_images/:id", to: "partnerships#add_images"
        patch "update/:id", to: "partnerships#update"
        delete "delete/:id", to: "partnerships#delete"
        delete "delete_all_images/:id", to: "partnerships#delete_all_images"
      end

      scope "projects" do
        get "index", to: "projects#index"
        get "index_pagination/:page", to: "projects#index_pagination"
        get "show/:id", to: "projects#show"
        post "create", to: "projects#create"
        patch "update/:id", to: "projects#update"
        delete "delete/:id", to: "projects#delete"
      end

      scope "administrators" do
        get "login", to: "administrators#login"
        get "logout", to: "administrators#logout"
        get "index", to: "administrators#index"
        get "show/:id", to: "administrators#show"
        post "create", to: "administrators#create"
        patch "update/:id", to: "administrators#update"
        delete "delete/:id", to: "administrators#delete"
      end
    end
  end
end
