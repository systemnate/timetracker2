class Task < ActiveRecord::Base
  searchkick index_name: -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  belongs_to :status
  belongs_to :product
  belongs_to :priority
  belongs_to :client
  has_many :task_details, dependent: :destroy

  validates :status, :product, :priority, :title, :summary, presence: true
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end  
end