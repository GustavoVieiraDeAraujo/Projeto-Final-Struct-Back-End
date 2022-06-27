FactoryBot.define do
  
  sequence :contact_email do |i|
    "teste#{i}@teste#{i}.com.br"
  end

  sequence :contact_localization do |j|
    "Localization #{j}"
  end

  factory :contact do
    name { "Contact 1" }
    localization { generate(:contact_localization) }
    email { generate(:contact_email) }
    number { 987654321 }
  end

end
