class TaskDetail < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  def self.important?
    important
  end
end