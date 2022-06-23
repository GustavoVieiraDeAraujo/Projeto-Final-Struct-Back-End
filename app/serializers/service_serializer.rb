class ServiceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :images_url

  def images_url
    if object.images.attached?
      array = []
      object.images.each do |image|
        array.append(rails_blob_path(image, only_path: true))
      end
    end
    array
  end

end
