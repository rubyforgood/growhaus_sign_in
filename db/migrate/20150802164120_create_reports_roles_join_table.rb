class CreateReportsRolesJoinTable < ActiveRecord::Migration
  def change
    create_table :reports_roles, id: false do |t|
      t.belongs_to :reports, index: true
      t.belongs_to :roles, index: true
    end
  end
end
