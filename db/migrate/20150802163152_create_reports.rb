class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.belongs_to :staff, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
