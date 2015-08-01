class UserBelongsToRole < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :role_id
    end
  end
end
