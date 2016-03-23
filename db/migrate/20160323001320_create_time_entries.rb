class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :project_id
      t.integer :developer_id
      t.integer :duration
      t.date :date

      t.timestamps null: false
    end
    add_index :time_entries, :project_id
    add_index :time_entries, :developer_id
  end
end
