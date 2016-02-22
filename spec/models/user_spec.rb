require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'associations' do
    it { should belong_to :role }
    it { should have_many :task_details }
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end
end
