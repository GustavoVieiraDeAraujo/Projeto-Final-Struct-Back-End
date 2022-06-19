class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :link ,:description, :members
  
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
end
