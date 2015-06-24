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

  scope :alltasks, -> {}
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end

  def default_view
    Task.all
  end
end