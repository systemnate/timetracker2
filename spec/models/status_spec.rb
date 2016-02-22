require 'rails_helper'

RSpec.describe Status, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'associations' do
    it { should belong_to :color }
    it { should have_many :tasks }
  end

  it 'should have a valid factory' do
    expect(build(:status)).to be_valid
  end

  it 'should have a valid closed factory' do
    expect(build(:status_closed)).to be_valid
  end
end
