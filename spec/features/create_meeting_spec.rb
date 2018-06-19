require 'rails_helper.rb'

feature 'create meetings' do
    background do
        visit '/'
    end

    
    scenario 'can create and show a meeting' do
        click_link 'New meeting'
        expect(page).to have_content'New meeting'
        fill_in 'Home team', with: 'Belle Vue Aces'
        fill_in 'Away team', with: 'Poole Pirates'
        click_button 'Save'
        expect(page).to have_content 'Belle Vue Aces'
        expect(page).to have_content 'Poole Pirates'
        click_link 'Show'
        expect(page).to have_content 'Show meeting'
    end
    
    scenario 'wont create a meeting without a date home or away team' do
        click_link 'New meeting'
        click_button 'Save'
        expect(page).to have_content 'can\'t be blank'
    end
    
    scenario 'can edit a meeting' do
        click_link 'New meeting'
        expect(page).to have_content'New meeting'
        fill_in 'Home team', with: 'Belle Vue Aces'
        fill_in 'Away team', with: 'Poole Pirates'
        click_button 'Save'
        expect(page).to have_content 'Belle Vue Aces'
        expect(page).to have_content 'Poole Pirates'
        click_link 'Edit'
        expect(page).to have_content 'Edit meeting'
        fill_in 'Away team', with: 'Leicester Lions'
        click_button 'Save'
        expect(page).to have_content 'Leicester Lions'
    end
    
end