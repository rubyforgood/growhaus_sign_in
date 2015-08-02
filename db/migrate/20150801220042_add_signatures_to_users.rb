class AddSignaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :volunteer_signature, :string
    add_column :users, :volunteer_signed_at, :timestamp
    add_column :users, :waiver_signed_at, :timestamp
    add_column :users, :photo_release_signed_at, :timestamp
  end
end
