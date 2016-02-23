require 'rails_helper'

describe 'status' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }

  before do 
    set_subdomain(account.subdomain)
    sign_user_in(user)
    page.first(:link, "Configuration").click
  end

  it "allows creation of new status" do
    Color.create(name: "Green")
    click_link("Add New Status")
    fill_in 'Name', with: 'New Status'
    page.select "Green", from: "status[color_id]"
    click_button('Submit')
    expect(page).to have_content("New Status")
  end
end
