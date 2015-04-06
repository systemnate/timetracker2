class TaskDetail < ActiveRecord::Base
  searchkick index_name: -> { [Apartment::Tenant.current, model_name.plural, Rails.env].join('_') }
  belongs_to :task
  belongs_to :user
  has_attached_file :task_attachment
  do_not_validate_attachment_file_type :task_attachment
  def self.important?
    important
  end
  
  def self.searchkick_index
    index_name = [Apartment::Tenant.current, model_name.plural, Rails.env].join('_')
    Searchkick::Index.new(index_name)
  end
end