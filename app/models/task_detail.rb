class TaskDetail < ActiveRecord::Base
  belongs_to :task

  def self.important?
    important
  end
end