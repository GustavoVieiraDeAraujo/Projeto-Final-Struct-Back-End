class ContactSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :id, :name, :email, :about

    def attributes(*args)
      data = super
      data[:service] = { id: object.service.id, name: object.service.name } if object.service
      data
    end
end