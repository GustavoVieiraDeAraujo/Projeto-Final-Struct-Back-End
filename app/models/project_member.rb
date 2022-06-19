class ProjectMember < ApplicationRecord
  validates :role, :member_id, :project_id, presence: true
  belongs_to :member
  belongs_to :project
end
