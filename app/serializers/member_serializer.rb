class MemberSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :office, :projects
  
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
end
