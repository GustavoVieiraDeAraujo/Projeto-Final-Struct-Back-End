FactoryBot.define do
  
  sequence :admin_email do |i|
    "admin#{i}@admin#{i}.com.br"
  end

  factory :administrator do
    name { "admin 1" }
    email { generate(:admin_email)}
    password {"admin2022"}   
    password_confirmation {"admin2022"}
  end
end
