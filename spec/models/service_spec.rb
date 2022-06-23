require 'rails_helper'

RSpec.describe Service, type: :model do
    describe "factory" do
        context "when using standard factory" do
          it "is valid" do
            expect(build(:service)).to be_valid 
          end
        end
    end

    describe "name" do
        context "when service hasn't name" do
          it "is not valid" do
            expect(build(:service, name: nil)).to be_invalid
          end
        end
        context "when service has name" do
          it "is valid" do
            expect(build(:service)).to be_valid
          end
        end
    end

    describe "description" do
        context "when description has nothing" do
          it "is not valid" do
            expect(build(:service, description: nil)).to be_invalid
          end
        end
        context "when description has something" do
          it "is valid" do
            expect(build(:service)).to be_valid
          end
        end
    end
end
