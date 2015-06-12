class Priority < ActiveRecord::Base
  belongs_to :color
  validates :name, presence: true
  validates :color_id, presence: true
end
