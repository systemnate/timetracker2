class AddNotifyEmailToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :notify_email, :string
  end
end
