require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :color }
  end

  describe 'associations' do
    it { should belong_to :color }
    it { should have_many :tasks }
  end

  it 'should have a valid factory' do
    expect(build_stubbed(:product)).to be_valid
  end
end
