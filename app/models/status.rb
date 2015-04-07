class Status < ActiveRecord::Base
  belongs_to :color
  validates :name, presence: true
  def self.names
    Status.all.collect { |s| s.name }
  end
end