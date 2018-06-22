require 'rails_helper'

describe Heat, type: :model  do
    
    it "has a valid factory" do
        expect(FactoryBot.build(:heat).save).to be_truthy
    end

    
    it "is invalid without a meeting_id" do
        expect(FactoryBot.build(:heat, meeting_id: nil).save).to be_falsy
    end
    
    it "is invalid without a heat_time" do
        expect(FactoryBot.build(:heat, heat_time: nil).save).to be_falsy
    end
    
    it "shouldn't have a heat number greater than 15" do
        expect(FactoryBot.build(:heat, heat_number: 16).save).to be_falsy
    end
    
end