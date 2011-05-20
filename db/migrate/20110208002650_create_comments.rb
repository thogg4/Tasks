class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.timestamps
      t.string :task_id
    end
  end

  def self.down
    drop_table :comments
  end
end
