class AddDateOnToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :date_on, :date
  end
end
