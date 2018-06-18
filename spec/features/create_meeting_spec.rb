require 'rails_helper.rb'

feature 'create meetings' do
    scenario 'can create a meeting' do
        visit '/'
        click_link 'New meeting'
    end
end