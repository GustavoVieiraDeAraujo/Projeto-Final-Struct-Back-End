require 'rails_helper'

RSpec.describe Office, type: :model do

    describe "factory" do
        context "when using standard factory" do
          it "is valid" do
            expect(build(:office)).to be_valid 
          end
        end
    end

    describe "name" do
        context "when office hasn't name" do
          it "is not valid" do
            expect(build(:office, name: nil)).to be_invalid
          end
        end
        context "when office has name" do
          it "is valid" do
            expect(build(:office)).to be_valid
          end
        end
    end


    describe "description" do
        context "when description has nothing" do
            it "is not valid" do
                expect(build(:office, description: nil)).to be_invalid
            end
        end
        context "when description has something" do
            it "is valid" do
                expect(build(:office)).to be_valid
            end
        end
    end

end
