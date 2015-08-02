class ActivitySession < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates_presence_of :start_time
  before_validation :set_start_time

  def close
    set_end_time unless end_time
  end

  def closed?
    !(end_time.nil?)
  end

  private

  def set_start_time
    self.start_time = Time.now
  end

  def set_end_time
    self.end_time = Time.now
    self.save
  end
end
