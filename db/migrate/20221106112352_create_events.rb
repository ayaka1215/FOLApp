class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :event_date
      t.time :event_start_time
      t.time :event_end_time
      t.text :content
      t.string :place
      t.timestamps
    end
  end
end
