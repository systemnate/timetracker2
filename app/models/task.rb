class Task < ActiveRecord::Base
  attr_accessor :client_name
  attr_accessor :status_name
  attr_accessor :priority_name
  attr_accessor :product_name
  acts_as_taggable
  searchkick index_name: -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  belongs_to :status
  belongs_to :product
  belongs_to :priority
  belongs_to :client
  belongs_to :project
  has_many :task_details, dependent: :destroy
  validates :status, :product, :priority, :title, :client, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :notify_email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  scope :alltasks, -> {}
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end
end