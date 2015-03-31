class Task < ActiveRecord::Base
  belongs_to :status
  belongs_to :product
  belongs_to :priority
  belongs_to :client
  has_many :task_details, dependent: :destroy

  validates :status, :product, :priority, :title, :summary, presence: true
end