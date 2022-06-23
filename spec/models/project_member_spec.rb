require 'rails_helper'

RSpec.describe ProjectMember, type: :model do

    describe "factory" do
        context "when using standard factory" do
          it "is valid" do
            expect(build(:project_member)).to be_valid 
          end
        end
    end

    describe "role" do
        context "when role doesn't exist" do
          it "is not valid" do
            expect(build(:project_member, role: nil)).to be_invalid
          end
        end
        context "when role exists" do
          it "is valid" do
            expect(build(:project_member)).to be_valid
          end
        end
    end

    describe "member_id" do
        context "when member_id doesn't exist" do
          it "is not valid" do
            expect(build(:project_member, member_id: nil)).to be_invalid
          end
        end
        context "when member_id exists" do
          it "is valid" do
            expect(build(:project_member)).to be_valid
          end
        end
    end

    describe "project_id" do
        context "when project_id doesn't exist" do
          it "is not valid" do
            expect(build(:project_member, project_id: nil)).to be_invalid
          end
        end
        context "when project_id exists" do
          it "is valid" do
            expect(build(:project_member)).to be_valid
          end
        end
    end
end
