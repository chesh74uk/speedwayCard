require 'rails_helper.rb'

feature 'create meetings' do
    background do
        visit '/'
        click_link 'New meeting'
        expect(page).to have_content'New meeting'
        fill_in 'Home team', with: 'Belle Vue Aces'
        fill_in 'Away team', with: 'Poole Pirates'
        click_button 'Create meeting'
    end
    
    scenario 'can create a meeting' do
        expect(page).to have_content 'Belle Vue Aces'
        expect(page).to have_content 'Poole Pirates'
    end
    
    scenario 'can show a meeting' do
        visit '/'
        click_link 'Show'
        expect(page).to have_content 'Show meeting'
    end
    
    scenario 'can edit a meeting' do
        visit '/'
        click_link 'Edit'
        expect(page).to have_content 'Edit meeting'
    end
end