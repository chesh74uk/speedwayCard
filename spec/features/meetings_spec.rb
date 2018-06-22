require 'rails_helper'

RSpec.feature "Meetings", type: :feature do
    
    scenario "creates a new meeting" do
       @meeting = FactoryBot.create(:meeting)
       visit root_path 
       click_link "New meeting"
       select("Poole Pirates", from: "meeting_home_team")
       fill_in "meeting_home_rider_1", with: @meeting.home_rider_1
       fill_in "meeting_home_rider_2", with: @meeting.home_rider_2
       fill_in "meeting_home_rider_3", with: @meeting.home_rider_3
       fill_in "meeting_home_rider_4", with: @meeting.home_rider_4
       fill_in "meeting_home_rider_5", with: @meeting.home_rider_5
       fill_in "meeting_home_rider_6", with: @meeting.home_rider_6
       fill_in "meeting_home_rider_7", with: @meeting.home_rider_7
       
       select("Somerset Rebels", from: "meeting_away_team")
       fill_in "meeting_away_rider_1", with: @meeting.away_rider_1
       fill_in "meeting_away_rider_2", with: @meeting.away_rider_2
       fill_in "meeting_away_rider_3", with: @meeting.away_rider_3
       fill_in "meeting_away_rider_4", with: @meeting.away_rider_4
       fill_in "meeting_away_rider_5", with: @meeting.away_rider_5
       fill_in "meeting_away_rider_6", with: @meeting.away_rider_6
       fill_in "meeting_away_rider_7", with: @meeting.away_rider_7
       
       click_button "Save"
       
       expect(page).to have_content("Meeting was successfully created.")
    end
    
end
