require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'associations' do
    it { should have_many :tasks }
    it { should have_many :projects }
  end

  it 'should have a valid factory' do
    expect(build(:client)).to be_valid
  end
end
