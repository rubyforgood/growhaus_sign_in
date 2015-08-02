class Report < ActiveRecord::Base
  belongs_to :staff
  has_and_belongs_to_many :role
end
