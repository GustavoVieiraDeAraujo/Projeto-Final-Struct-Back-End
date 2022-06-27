require 'rails_helper'

RSpec.describe Administrator, type: :model do

  describe "factory" do
      context "when using standard factory" do
        it "is valid" do
          expect(build(:administrator)).to be_valid 
        end
      end
    end

  describe "name" do
      context "when administrator hasn't name" do
        it "is not valid" do
          expect(build(:administrator, name: nil)).to be_invalid
        end
      end
      context "when administrator has name" do
        it "is valid" do
          expect(build(:administrator)).to be_valid
        end
      end
  end

end
