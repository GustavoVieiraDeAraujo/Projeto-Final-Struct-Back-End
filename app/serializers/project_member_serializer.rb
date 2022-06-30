class ProjectMemberSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :project, :member

  def project
    projeto = object.project
    {
      id: projeto.id,
      name: projeto.name,
      link: projeto.link,
      description: projeto.description
    }
    end

  def member
    member = object.member
    office = member.office
    {
      id: member.id,
      name: member.name,
      age: member.age,
      role: object.role,
      office: {
        id: office.id,
        name: office.name,
        description: office.description
      } 
    }
  end
  

end
