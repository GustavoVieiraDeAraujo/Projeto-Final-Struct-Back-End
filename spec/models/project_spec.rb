require 'rails_helper'

RSpec.describe Project, type: :model do

    describe "factory" do
        context "when using standard factory" do
          it "is valid" do
            expect(build(:project)).to be_valid 
          end
        end
    end

    describe "name" do
        context "when project hasn't name" do
          it "is not valid" do
            expect(build(:project, name: nil)).to be_invalid
          end
        end
        context "when project has name" do
          it "is valid" do
            expect(build(:project)).to be_valid
          end
        end
    end

    describe "link" do
        context "when link doesn't exist" do
          it "is not valid" do
            expect(build(:project, link: nil)).to be_invalid
          end
        end
        context "when link exists" do
          it "is valid" do
            expect(build(:project)).to be_valid
          end
        end
    end

    describe "description" do
        context "when description has nothing" do
          it "is not valid" do
            expect(build(:project, description: nil)).to be_invalid
          end
        end
        context "when description has something" do
          it "is valid" do
            expect(build(:project)).to be_valid
          end
        end
    end
end
