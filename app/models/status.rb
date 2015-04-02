class Status < ActiveRecord::Base
  belongs_to :color
  def self.names
    Status.all.collect { |s| s.name }
  end
end