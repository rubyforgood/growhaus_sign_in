# Role is defined as the type of user signing in. Activity is the type of
# action performed by user.
class CreateRoleActivityJoinTable < ActiveRecord::Migration
  def change
    create_table :activities_roles, id: false do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :roles, index: true
    end
  end
end
