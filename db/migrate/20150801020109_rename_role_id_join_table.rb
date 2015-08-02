# Role represents the type of user 
class RenameRoleIdJoinTable < ActiveRecord::Migration
  def change
    change_table :activities_roles do |t|
      t.rename :roles_id, :role_id
    end
  end
end
