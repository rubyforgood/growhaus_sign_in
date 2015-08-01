class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.string :waiver_signature
      t.string :photo_release

      t.timestamps null: false
    end
  end
end
