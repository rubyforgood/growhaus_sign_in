# Activities differ by roles. Must log in and log out of activities.
class ActivitySessionController < ApplicationController
  def index
    @activity_sessions = ActivitySession.all
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
    respond_to do |format|
      if @activity_session.update(activity_session_params)
        format.html { redirect_to welcome_path, notice: 'Thank you!' }
      end
    end
  end

  private

  def activity_session_params
    params.require(:activity_session).permit(:user_id, :activity_id)
  end
end
