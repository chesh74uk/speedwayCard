require 'rails_helper'

RSpec.describe White, type: :model do
    
    it "has a valid factory" do
        expect(FactoryBot.build(:white).save).to be_truthy
    end
    
    it "is not valid without a heat_id" do
        expect(FactoryBot.build(:white, heat_id: nil).save).to be_falsy
    end
    
    it "is not valid without a rider name" do
        expect(FactoryBot.build(:white, rider_name: nil).save).to be_falsy
    end
    
    it "is not valid without a score" do
        expect(FactoryBot.build(:white, score: nil).save).to be_falsy
    end
    
    it "is not valid with a score greater than 3" do
        expect(FactoryBot.build(:white, score: 4).save).to be_falsy
    end
    
    it "is not valid without a gate number" do
        expect(FactoryBot.build(:white, gate_number: nil).save).to be_falsy
    end
    
    it "is not valid with a gate greater than 4" do
        expect(FactoryBot.build(:white, gate_number: 5).save).to be_falsy
    end

end
