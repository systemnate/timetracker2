require 'rails_helper'

describe 'account creation' do
  it 'allows user to create account' do
    visit root_path
    click_link 'Create Account'

    fill_in 'Name', with: 'Nate'
    fill_in 'Email', with: 'nate.dalo@yahoo.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Subdomain', with: 'testsubdomain'
    click_button 'Create Account'
    
    within(".alert-message") do
      expect(page).to have_content('Signed up successfully')
    end
  end
end
