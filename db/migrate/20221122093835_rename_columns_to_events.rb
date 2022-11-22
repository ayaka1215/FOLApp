class RenameColumnsToEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :event_date, :date
    rename_column :events, :event_start_time, :start_time
    rename_column :events, :event_end_time, :end_time
  end
end
