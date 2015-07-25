require 'rails_helper'

RSpec.describe Task do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :status }
    it { should validate_presence_of :product }
    it { should validate_presence_of :priority }
    it { should validate_presence_of :client }
    it { should validate_presence_of :assigned_to }
  end
  describe 'associations' do
    it { should belong_to :status }
    it { should belong_to :product }
    it { should belong_to :priority }
    it { should belong_to :client }
  end

  it 'has a valid factory' do
    create(:task).should be_valid
  end

  it 'is invalid without a title' do
    build(:task, title: nil).should_not be_valid
  end

  it 'is invalid without a status' do
    build(:task, status: nil).should_not be_valid
  end

  it 'is invalid without a product' do
    build(:task, status: nil).should_not be_valid
  end

  it 'is invalid without a priority' do
    build(:task, product: nil).should_not be_valid
  end

  it 'is invalid without a client' do
    build(:task, client: nil).should_not be_valid
  end

  it 'is invalid without being assigned to someone' do
    build(:task, assigned_to: nil).should_not be_valid
  end
end
