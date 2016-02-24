class Task < ActiveRecord::Base
  attr_accessor :client_name
  attr_accessor :status_name
  attr_accessor :priority_name
  attr_accessor :product_name
  acts_as_taggable
  #searchkick index_name: -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  belongs_to :status
  belongs_to :product
  belongs_to :priority
  belongs_to :client
  belongs_to :project
  has_many :task_details, dependent: :destroy
  validates :status, :product, :priority, :title, :client, :assigned_to, presence: true
  VALID_EMAIL_REGEX = /\A(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+([,.](([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})+)*\z/i
  validates :notify_email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  scope :alltasks, -> {}
  
  delegate :name, :to => :status, :prefix => true
  delegate :name, :to => :priority, :prefix => true
  delegate :name, :to => :product, :prefix => true
  delegate :name, :to => :client, :prefix => true

  def status_color_name
    self.status.color_name
  end

  def product_color_name
    self.product.color_name
  end

  def priority_color_name
    self.priority.color_name
  end

  def client_color_name
    self.client.color_name
  end
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end

  def time_spent_by(user_id)
    time_spent = 0
    task_details.each do |td|
      if td.user_id == user_id
        time_spent += td.time_spent
      end
    end
    time_spent
  end
end
