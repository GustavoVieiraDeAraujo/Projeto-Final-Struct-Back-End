require 'rails_helper'

RSpec.describe Member, type: :model do

  describe "factory" do
    context "when using standard factory" do
      it "is valid" do
        expect(build(:member)).to be_valid 
      end
    end
  end

  describe "name" do
    context "when user hasn't name" do
      it "is not valid" do
        expect(build(:member, name: nil)).to be_invalid 
      end
    end
    context "when user has name" do
      it "is valid" do
        expect(build(:member)).to be_valid
      end
    end
  end

  describe "age" do
    
    context "when user hasn't age" do
      it "is not valid" do
        expect(build(:member, age: nil)).to be_invalid
      end
    end

    context "when user has age" do
      it "is valid" do
        expect(build(:member)).to be_valid
      end
    end
  end

end
