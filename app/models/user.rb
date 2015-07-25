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
end
