class Client < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :client_contacts
end
