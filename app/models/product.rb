class Product < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :color
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true

  delegate :name, :to => :color, :prefix => true
end
