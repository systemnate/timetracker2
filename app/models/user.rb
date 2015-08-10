class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  has_many :tasks
  has_many :task_details
  devise :invitable, :database_authenticatable, :recoverable, :rememberable, :validatable
  validates :name, presence: true

  def admin?
    begin
      self.role.name == "Administrator"
    rescue
      true
    end
  end

  def regular?
    begin
      self.role.name == "Regular"
    rescue
      true
    end
  end

  def viewer?
    begin
      self.role.name == "Viewer"
    rescue
      true
    end
  end

  def average_handle_time
    time_spent = 0
    tasks = Task.where('assigned_to = ?', self.id).
      where(status_id: Status.select('id').where('is_complete = ?', true))
    tasks.each do |task|
      time_spent += task.time_spent_by(self.id)
    end
    if tasks.count != 0
      (time_spent.to_f / tasks.count).round(2)
    else
      0
    end
  end
end
