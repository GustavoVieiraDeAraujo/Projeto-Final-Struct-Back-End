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

  describe "about" do
  
    context "when contact hasn't about" do
      it "is not valid" do
        expect(build(:contact, about: nil)).to be_invalid
      end
    end

    context "when contact has about" do
      it "is valid" do
        expect(build(:contact)).to be_valid
      end
    end

  end
end