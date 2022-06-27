require 'faker'

# link para conferir outros Fakers
# https://github.com/faker-ruby/faker

#Criando cargos,parcerias,projetos,serviços,contatos
30.times do |i|
    Office.create!(name: Faker::Job.position  , description: Faker::Alphanumeric.unique.alphanumeric(number: 50))
    Partnership.create!(name: Faker::Name.name, link: Faker::Internet.url)
    Project.create!(name: Faker::Ancient.god , link: Faker::Internet.url, description: Faker::Alphanumeric.alphanumeric(number: 50))
    Service.create!(name: Faker::Ancient.titan , description: Faker::Alphanumeric.alphanumeric(number: 50))
    Contact.create!(name: Faker::Name.name, localization: Faker::Address.full_address , email: Faker::Internet.email ,number: Faker::Number.number(digits: 9))
end

#Criando membros
30.times do |i|
    Member.create!(name: Faker::Name.unique.name, age: Faker::Number.between(from: 1, to: 100), office_id: 1)
end

#Criando associação entre membros e projetos
30.times do
    ProjectMember.create!(member_id:(rand(1...30)), project_id: rand(1...30), role: Faker::Company.profession)
end

#Administrador
Administrator.create!(name:"admin",email:"admin@admin.com", password:"admin2022")

# Fotos de alguns membros
Member.find_by(id:1).photo.attach(io: File.open("./public/luffy.jpg"), filename: "luffy.jpg")
Member.find_by(id:2).photo.attach(io: File.open("./public/zoro.jpg"), filename: "zoro.jpg")
Member.find_by(id:3).photo.attach(io: File.open("./public/usopp.jpg"), filename: "usopp.jpg")
Member.find_by(id:4).photo.attach(io: File.open("./public/sanji.jpeg"), filename: "sanji.jpeg") 

#Imagens de algumas parcerias Parcerias
Partnership.find_by(id:1).images.attach(io: File.open("./public/nasa.png"), filename: "nasa.png")
Partnership.find_by(id:1).images.attach(io: File.open("./public/diretornasa.jpeg"), filename: "diretornasa.jpeg")
Partnership.find_by(id:2).images.attach(io: File.open("./public/google.jpeg"), filename: "google.jpeg")
Partnership.find_by(id:3).images.attach(io: File.open("./public/meta.png"), filename: "meta.png")
Partnership.find_by(id:4).images.attach(io: File.open("./public/spotify.png"), filename: "spotify.png")

#Fotos de alguns projetos
Project.find_by(id:1).photo.attach(io: File.open("./public/pokemon-1.jpg"), filename: "pokemon-1.jpg")
Project.find_by(id:2).photo.attach(io: File.open("./public/pokemon-2.jpeg"), filename: "pokemon-2.jpeg")
Project.find_by(id:3).photo.attach(io: File.open("./public/pokemon-3.jpeg"), filename: "pokemon-3.jpeg")
Project.find_by(id:4).photo.attach(io: File.open("./public/pokemon-4.jpg"), filename: "pokemon-4.jpg")

#Imagens de alguns serviços
Service.find_by(id:1).images.attach(io: File.open("./public/1.jpeg"), filename: "1.jpeg")
Service.find_by(id:1).images.attach(io: File.open("./public/2.jpeg"), filename: "2.jpeg")
Service.find_by(id:2).images.attach(io: File.open("./public/3.jpeg"), filename: "3.jpeg")
Service.find_by(id:3).images.attach(io: File.open("./public/4.jpeg"), filename: "4.jpeg")
Service.find_by(id:4).images.attach(io: File.open("./public/5.jpeg"), filename: "5.jpeg")