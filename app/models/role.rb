class Role < ActiveRecord::Base
  has_many :user
  has_and_belongs_to_many :activity
end
