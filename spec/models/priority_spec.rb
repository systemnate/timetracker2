require 'rails_helper'

RSpec.describe Priority do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :color_id }
  end

  describe 'associations' do
    it { should have_many :tasks }
    it { should belong_to :color }
  end

  it 'should have a valid factory' do
    expect(build(:priority)).to be_valid
  end
end
