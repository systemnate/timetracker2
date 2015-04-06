class AddAttachmentTaskAttachmentToTaskDetails < ActiveRecord::Migration
  def self.up
    change_table :task_details do |t|
      t.attachment :task_attachment
    end
  end

  def self.down
    remove_attachment :task_details, :task_attachment
  end
end
