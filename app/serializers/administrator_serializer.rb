class AdministratorSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :name, :email, :authentication_token
end
