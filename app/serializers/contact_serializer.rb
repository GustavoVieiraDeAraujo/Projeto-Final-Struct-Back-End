class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :localization, :email, :number
end