require 'rails_helper'

RSpec.describe Task do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :status }
    it { should validate_presence_of :product }
    it { should validate_presence_of :priority }
    it { should validate_presence_of :client }
  end
  describe 'associations' do
    it { should belong_to :status }
    it { should belong_to :product }
    it { should belong_to :priority }
    it { should belong_to :client }
  end
end