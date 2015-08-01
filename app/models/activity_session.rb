class ActivitySession < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates_presence_of :start_time
  before_validation :set_start_time

  private

  def set_start_time
    self.start_time = Time.now
  end
end
