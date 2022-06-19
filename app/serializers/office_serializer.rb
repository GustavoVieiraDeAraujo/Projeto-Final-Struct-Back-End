class OfficeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :members_with_this_office
  
  def members_with_this_office 
    array = []
    object.member.each do |x| 
      array.append(
        id: x.id,
        name: x.name
      )
    end
    array
  end
end
