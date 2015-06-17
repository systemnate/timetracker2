class Status < ActiveRecord::Base
  belongs_to :color
  validates :name, presence: true
  validates :color_id, presence: true

  def self.names
    Status.all.collect { |s| s.name }
  end
end