require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe "factory" do
    context "when using standard factory" do
      it "is valid" do
        expect(build(:contact)).to be_valid 
      end
    end
  end

  describe "name" do

    context "when contact hasn't name" do
      it "is not valid" do
        expect(build(:contact, name: nil)).to be_invalid 
      end
    end

    context "when contact has name" do
      it "is valid" do
        expect(build(:contact)).to be_valid
      end
    end

  end

  describe "email" do
    
    context "when contact hasn't email" do
      it "is not valid" do
        expect(build(:contact, email: nil)).to be_invalid
      end
    end

    context "when contact has email" do
      it "is valid" do
        expect(build(:contact)).to be_valid
      end
    end

  end

  describe "localization" do
  
    context "when contact hasn't localization" do
      it "is not valid" do
        expect(build(:contact, localization: nil)).to be_invalid
      end
    end

    context "when contact has localization" do
      it "is valid" do
        expect(build(:contact)).to be_valid
      end
    end

  end

  describe "number" do
  
    context "when contact hasn't number" do
      it "is not valid" do
        expect(build(:contact, number: nil)).to be_invalid
      end
    end

    context "when contact has number" do
      it "is valid" do
        expect(build(:contact)).to be_valid
      end
    end
  end
  
end
