class Activity < ActiveRecord::Base
  
  has_one :role
  has_many :users, through: :roles

end
