class AddFileToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :file, :string
  end

  def self.down
    remove_column :tasks, :file
  end
end
