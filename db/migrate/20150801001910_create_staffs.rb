class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :account_url
      t.string :provider
      t.string :token
      t.string :uid

      t.timestamps null: false
    end
  end
end
