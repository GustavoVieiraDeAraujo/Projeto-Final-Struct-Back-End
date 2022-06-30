require 'faker'

# link para conferir outros Fakers
# https://github.com/faker-ruby/faker

#Administrador
Administrator.create!(name:"admin",email:"admin@admin.com", password:"admin2022")

#Criando cargos,parcerias,projetos,serviços,contatos
10.times do |i|
    Office.create!(name: Faker::Job.position  , description: Faker::Alphanumeric.unique.alphanumeric(number: 50))
    Partnership.create!(name: Faker::Name.name, link: Faker::Internet.url)
    Project.create!(name: Faker::Ancient.god , link: Faker::Internet.url, description: Faker::Alphanumeric.alphanumeric(number: 50))
    Service.create!(name: Faker::Ancient.titan , description: Faker::Alphanumeric.alphanumeric(number: 50))
end

#Criando membros
10.times do |i|
    Contact.create!(name: Faker::Name.name, email: Faker::Internet.email ,about: Faker::Alphanumeric.unique.alphanumeric(number: 50), service_id: rand(1...10))
    Member.create!(name: Faker::Name.unique.name, age: Faker::Number.between(from: 1, to: 100), office_id: rand(1...10))
end

#Criando associação entre membros e projetos
20.times do
    ProjectMember.create!(member_id:(rand(1...10)), project_id: rand(1...10), role: Faker::Company.profession)
end

# Fotos de alguns membros
for i in ["luffy.jpg","zoro.jpg","usopp.jpg","sanji.jpeg"] do
    Member.find_by(id:rand(1...10)).photo.attach(io: File.open("./public/#{i}"), filename: i)
end

#Imagens de algumas parcerias Parcerias
for j in ["nasa.png","diretornasa.jpeg","google.jpeg","meta.png","spotify.png"] do
    Partnership.find_by(id:rand(1..10)).images.attach(io: File.open("./public/#{j}"), filename: j)
end

#Fotos de alguns projetos
for k in ["pokemon-1.jpg","pokemon-2.jpeg","pokemon-3.jpeg","pokemon-4.jpg"] do
    Project.find_by(id:rand(1..10)).photo.attach(io: File.open("./public/#{k}"), filename: k) 
end

#Imagens de alguns serviços
for l in ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","service_aplicativo.png","service_outro.png","service_sistemaWeb.png","service_website.png"] do
    Service.find_by(id:rand(1..10)).images.attach(io: File.open("./public/#{l}"), filename: l)
end


