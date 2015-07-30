class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :client
  belongs_to :user

  validates :title, :client, :allotted_time, presence: true

  def self.time_spent(project)
    time_spent = 0
    @all_tasks = project.tasks
    @all_tasks.each do |task|
      task.task_details.each do |td|
        time_spent += td.time_spent
      end
    end
    time_spent / 60.0
  end

  def allotted_time=(value)
    write_attribute(:allotted_time, value.to_i * 60.0)
  end

  def allotted_time
    read_attribute(:allotted_time).to_f / 60.0
  end
end
