class Product < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :color
  validates :name, presence: true
  validates :color, presence: true
end