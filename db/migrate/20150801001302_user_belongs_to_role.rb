class UserBelongsToRole < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :role
    end
  end
end
