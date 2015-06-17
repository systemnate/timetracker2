class Task < ActiveRecord::Base
  acts_as_taggable
  searchkick index_name: -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  belongs_to :status
  belongs_to :product
  belongs_to :priority
  belongs_to :client
  belongs_to :project
  has_many :task_details, dependent: :destroy

  validates :status, :product, :priority, :title, :summary, :client, presence: true

  Status.all.each do |status|
    puts "Running the Status code"
    scope "#{status.name}".downcase.delete(' '), -> { where('status_id = ?', status.id).order('created_at DESC') }
  end

  Priority.all.each do |priority|
    scope "#{priority.name}".downcase.delete(' '), -> { where('priority_id = ?', priority.id).order('created_at DESC') }
  end

  Product.all.each do |product|
    scope "#{product.name}".downcase.delete(' '), -> { where('product_id = ?', product.id).order('created_at DESC') }
  end

  scope :alltasks, -> {}
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end  
end