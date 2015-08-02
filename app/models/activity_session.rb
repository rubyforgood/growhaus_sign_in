class ActivitySession < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates_presence_of :start_time
  before_validation :set_start_time
  before_create :close_other_sessions

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

  def close_other_sessions
    user = User.find user_id
    sessions = user.activity_sessions.reject {|e| e.closed? }
    sessions.each {|s| s.close }
  end
end
