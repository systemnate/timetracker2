require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  it 'has a valid factory' do
    create(:role).should be_valid
  end

  it 'has a valid admin factory' do
    create(:role_admin).should be_valid
  end

  it 'has a valid regular factory' do
    create(:role_regular).should be_valid
  end

  it 'has a valid viewer factory' do
    create(:role_viewer).should be_valid
  end
end
