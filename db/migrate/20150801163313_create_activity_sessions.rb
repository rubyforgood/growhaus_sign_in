class CreateActivitySessions < ActiveRecord::Migration
  def change
    create_table :activity_sessions do |t|
      t.belongs_to :user
      t.belongs_to :activity
      t.timestamp  :start_time
      t.timestamp  :end_time

      t.timestamps null: false
    end
  end
end
