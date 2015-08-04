class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  validates :content, presence: true

  def completed?
    !completed_at.blank?
  end
end
