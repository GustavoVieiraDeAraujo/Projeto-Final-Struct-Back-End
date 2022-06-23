require 'rails_helper'

RSpec.describe Partnership, type: :model do

    describe "factory" do
        context "when using standard factory" do
          it "is valid" do
            expect(build(:partnership)).to be_valid 
          end
        end
    end

    describe "name" do
        context "when partnership hasn't name" do
          it "is not valid" do
            expect(build(:partnership, name: nil)).to be_invalid
          end
        end
        context "when partnership has name" do
          it "is valid" do
            expect(build(:partnership)).to be_valid
          end
        end
    end

    describe "link" do
        context "when link doesn't exist" do
          it "is not valid" do
            expect(build(:partnership, link: nil)).to be_invalid
          end
        end
        context "when link exists" do
          it "is valid" do
            expect(build(:partnership)).to be_valid
          end
        end
    end

end
