FactoryBot.define do

  sequence :contact_email do |i|
    "contact#{i}contact#{i}.com.br"
  end

  factory :contact do
    name { "Contact 1" }
    email { generate(:contact_email) }
    about { "Contact 1" }
    service { create(:service) }
  end
end
