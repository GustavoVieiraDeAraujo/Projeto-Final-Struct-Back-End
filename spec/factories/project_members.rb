FactoryBot.define do
  factory :project_member do
    role { "Role 1" }
    member { create(:member) }
    project { create(:project) }
  end
end
