class Product < ActiveRecord::Base
  belongs_to :color
  validates :name, presence: true
  validates :color, presence: true
end