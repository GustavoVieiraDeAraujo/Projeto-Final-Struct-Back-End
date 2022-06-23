FactoryBot.define do
  factory :member do
    name { "Membro 1" }
    age { 2022 }
    office { create(:office) }
  end
end
