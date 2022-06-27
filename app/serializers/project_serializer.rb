class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :link , :photo_url, :description, :members
  
  def members 
    array = []
    object.project_members.each do |x| 
      array.append(
        id: x.member.id,
        name: x.member.name,
        role_in_the_project: x.role                  
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
