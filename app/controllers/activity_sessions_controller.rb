class ActivitySessionsController < ApplicationController

  def index
    user = User.find_by(id: activity_session_params["user_id"])
    if user
      @activity_sessions = user.activity_sessions
    else
      @activity_sessions = ActivitySession.all
    end
  end

  def show
  end

  def new
    @activity_session = ActivitySession.new
  end

  def create
    @activity_session = ActivitySession.new(activity_session_params)

    respond_to do |format|
      if @activity_session.save
        format.html { redirect_to welcome_path, notice: 'Thank you!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @activity_session = ActivitySession.find activity_session_params["id"]
    @activity_session.close if @activity_session && activity_session_params["checkout"] == "true"
    if @activity_session.closed?
      redirect_to welcome_path, notice: 'Thank you!'
    else
      redirect_to welcome_path, alert: 'Unable to check out. Please contact an admin'
    end
  end

  private

  def activity_session_params
    params.permit(:user_id, :activity_id, :id, :checkout)
  end
end 
