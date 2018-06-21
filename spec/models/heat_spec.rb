require 'rails_helper'

describe Meeting do
    
    it "has a valid factory" do
        expect(FactoryBot.build(:meeting).save).to be_truthy
    end
    
    it "is invalid without a date" do
        expect(FactoryBot.build(:meeting, date: nil).save).to be_falsy
    end
    
    it "is invalid without a home_team" do
        expect(FactoryBot.build(:meeting, home_team: nil).save).to be_falsy
    end
    
    it "is invalid without an away_team" do
        expect(FactoryBot.build(:meeting, away_team: nil).save).to be_falsy
    end
end