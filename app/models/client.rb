class Client < ActiveRecord::Base
  validates :name, presence: true
end