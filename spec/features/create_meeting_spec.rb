require 'rails_helper.rb'

feature 'create meetings' do
    scenario 'can create a meeting' do
        visit '/'
        click_link 'New meeting'
        expect(page).to have_content'New meeting'
        fill_in 'Home team', with: 'Belle Vue Aces'
        fill_in 'Away team', with: 'Poole Pirates'
        click_button 'Create meeting'
        expect(page).to have_content 'Belle Vue Aces'
        expect(page).to have_content 'Poole Pirates'
    end
end