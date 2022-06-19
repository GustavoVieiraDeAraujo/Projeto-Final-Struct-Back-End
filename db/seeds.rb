# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Office
Office.create!(name:"Office 1", description:"Office 1")
Office.create!(name:"Office 2", description:"Office 2")
Office.create!(name:"Office 3", description:"Office 3")
Office.create!(name:"Office 4", description:"Office 4")
Office.create!(name:"Office 5", description:"Office 5")
Office.create!(name:"Office 6", description:"Office 6")

#Member
Member.create!(name:"Member 1", age:2022, office_id:1)
Member.create!(name:"Member 2", age:2022, office_id:2)
Member.create!(name:"Member 3", age:2022, office_id:3)
Member.create!(name:"Member 4", age:2022, office_id:4)
Member.create!(name:"Member 5", age:2022, office_id:5)
Member.create!(name:"Member 6", age:2022, office_id:6)

#Parcerias
Partnership.create!(name:"Partnership 1", link:"Partnership 1")
Partnership.create!(name:"Partnership 2", link:"Partnership 2")
Partnership.create!(name:"Partnership 3", link:"Partnership 3")
Partnership.create!(name:"Partnership 4", link:"Partnership 4")
Partnership.create!(name:"Partnership 5", link:"Partnership 5")
Partnership.create!(name:"Partnership 6", link:"Partnership 6")

#Projetos
Project.create!(name:"Project 1", link:"Project 1", description:"Project 1")
Project.create!(name:"Project 2", link:"Project 2", description:"Project 2")
Project.create!(name:"Project 3", link:"Project 3", description:"Project 3")
Project.create!(name:"Project 4", link:"Project 4", description:"Project 4")
Project.create!(name:"Project 5", link:"Project 5", description:"Project 5")
Project.create!(name:"Project 6", link:"Project 6", description:"Project 6")

#Serviços
Service.create!(name:"Service 1", description:"Service 1")
Service.create!(name:"Service 2", description:"Service 2")
Service.create!(name:"Service 3", description:"Service 3")
Service.create!(name:"Service 4", description:"Service 4")
Service.create!(name:"Service 5", description:"Service 5")
Service.create!(name:"Service 6", description:"Service 6")

#Membros dos Projetos
ProjectMember.create!(member_id:1, project_id:1, role:"Role 1")
ProjectMember.create!(member_id:2, project_id:2, role:"Role 2")
ProjectMember.create!(member_id:3, project_id:3, role:"Role 3")
ProjectMember.create!(member_id:4, project_id:4, role:"Role 4")
ProjectMember.create!(member_id:5, project_id:5, role:"Role 5")
ProjectMember.create!(member_id:6, project_id:6, role:"Role 6")
ProjectMember.create!(member_id:1, project_id:3, role:"Role 7")
ProjectMember.create!(member_id:1, project_id:4, role:"Role 8")
ProjectMember.create!(member_id:2, project_id:6, role:"Role 9")
ProjectMember.create!(member_id:5, project_id:3, role:"Role 10")
ProjectMember.create!(member_id:6, project_id:2, role:"Role 11")
ProjectMember.create!(member_id:4, project_id:2, role:"Role 12")

#Administrador
Administrator.create!(name:"Poderoso Chefão",email:"PoderosoChefão@PoderosoChefão.com.br", password:"123456789")