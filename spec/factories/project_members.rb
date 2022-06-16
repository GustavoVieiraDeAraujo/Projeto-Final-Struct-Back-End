FactoryBot.define do
  factory :project_member do
    role { "MyString" }
    member { nil }
    project { nil }
  end
end
