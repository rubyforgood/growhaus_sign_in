# Activity represents the type of action user performs in their Role
class Activity < ActiveRecord::Base
  has_and_belongs_to_many :role
  has_many :users, through: :roles
end
