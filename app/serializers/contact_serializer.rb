class ContactSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :about, :service
    has_many :service
end