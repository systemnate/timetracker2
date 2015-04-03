class Task < ActiveRecord::Base
  acts_as_taggable
  searchkick index_name: -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  belongs_to :status
  belongs_to :product
  belongs_to :priority
  belongs_to :client
  has_many :task_details, dependent: :destroy

  validates :status, :product, :priority, :title, :summary, presence: true

  Status.all.each do |status|
    scope "#{status.name}".downcase, -> { where('status_id = ?', status.id).order('created_at DESC') }
  end

  Priority.all.each do |priority|
    scope "#{priority.name}".downcase, -> { where('priority_id = ?', priority.id).order('created_at DESC') }
  end

  Product.all.each do |product|
    scope "#{product.name}".downcase, -> { where('product_id = ?', product.id).order('created_at DESC') }
  end

  scope :alltasks, -> {}
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end  
end