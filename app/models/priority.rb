class Priority < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :color
  validates :name, presence: true, uniqueness: true
  validates :color_id, presence: true
  delegate :name, :to => :color, :prefix => true
end
