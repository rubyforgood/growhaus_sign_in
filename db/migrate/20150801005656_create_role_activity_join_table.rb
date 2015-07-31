class CreateRoleActivityJoinTable < ActiveRecord::Migration
  def change

    create_table :activities_roles, id: false do |t|

      t.belongs_to :activity, index: true
      t.belongs_to :roles, index: true

    end

  end
end
