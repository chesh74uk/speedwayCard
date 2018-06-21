require 'rails_helper'

RSpec.describe Meeting, type: :model do
    
    it 'has a valid factory' do
        # Setup
        
        # Exercise 
        # Verify
        expect(FactoryBot.build(:meeting).save).to be_true
        # Teardown
    end
    
    it 'is invalid without a date' do
        # Setup
        # Exercise 
        # verify
        # Teardown
    end
  
end   
