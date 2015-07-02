require 'rails_helper'

describe 'navigation' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before do 
    set_subdomain(account.subdomain)
    sign_user_in(user)
    page.first(:link, "Configuration").click
  end
  
  it 'allows navigation to the configuration page' do
    expect(page).to have_content("Configuration")
  end

  it 'allows navigation to add new client' do
    click_link("Add New Client")
    expect(page).to have_content("New Client")
  end

  it 'allows navigation to add new product' do
    click_link("Add New Product")
    expect(page).to have_content("New Product")
  end

  it 'allows navigation to add new status' do
    click_link("Add New Status")
    expect(page).to have_content("New Status")
  end

  it 'allows navigation to add new priority' do
    click_link("Add New Priority")
    expect(page).to have_content("New Priority")
  end      
end