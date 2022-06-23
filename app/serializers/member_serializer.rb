class MemberSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :age, :photo_url, :office, :projects
  
  def office
    array = {
      id: object.office.id,
      name: object.office.name,
      description: object.office.description
    }
    array
  end

  def projects 
    array = []
    object.project_members.each do |x| 
      array.append(
        id: x.project.id,
        name: x.project.name,
      )
    end
    array
  end

  def photo_url
    if object.photo.attached?
      rails_blob_path(object.photo, only_path: true)
    end
  end

end
