require 'rails_helper'
require 'pry'

RSpec.describe ActivitySession, type: :model do
  let(:user) { create :user }
  let(:activity) { create :activity }

  it 'has a user' do
    activity_session = build :activity_session, user: user
    expect(activity_session.user).to eq user
  end

  it 'has an activity' do
    activity_session = build :activity_session, activity: activity
    expect(activity_session.activity).to eq activity
  end

  it 'sets start time on initialization' do
    activity_session = ActivitySession.create user: user, activity: activity
    expect(activity_session.start_time).to_not be_nil
  end
end
