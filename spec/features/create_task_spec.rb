require 'rails_helper'

describe 'task creation' do
  let(:user) { build(:user) }
  let!(:account) { create(:account_with_schema, owner: user) }
  before do 
    set_subdomain(account.subdomain)
    sign_user_in(user)
    @client = FactoryGirl.create :client
    @status = FactoryGirl.create :status
    @product = FactoryGirl.create :product
    @priority = FactoryGirl.create :priority
  end

  it 'allows creation of a task' do
    visit new_task_path
    fill_in 'Title', with: 'Test Task'
    select user.name, from: 'Assigned To'
    select @client.name, from: 'task_client_id'
    select @status.name, from: 'task_status_id'
    select @product.name, from: 'task_product_id'
    select @priority.name, from: 'task_priority_id'
    click_button('Submit')
    expect(page).to have_content "Task created successfully!"
    expect(page).to have_content "New Detail"
    fill_in 'task_detail[body]', with: 'Test Task Details...'
    click_button('Save')
    expect(page).to have_content "New detail successfully created!"
    expect(page).to have_content @client.name
    expect(page).to have_content @status.name
    expect(page).to have_content @product.name
    expect(page).to have_content @priority.name
  end
end
