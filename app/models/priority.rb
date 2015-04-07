class Priority < ActiveRecord::Base
  belongs_to :color
  validates :name, presence: true
end
