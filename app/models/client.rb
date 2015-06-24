class Client < ActiveRecord::Base
  validates :name, presence: true
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
end