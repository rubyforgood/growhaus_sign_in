# Role represents the user's relation to the organization
class Role < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :activity
end
