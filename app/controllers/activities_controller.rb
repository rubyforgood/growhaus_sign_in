class ActivitiesController < ApplicationController

  def index
    @user = User.find_by(id: activity_params["user_id"])
    if @user
      @activities = @user.role.activity
    else
      @activities = Activity.all
    end
  end

  private

  def activity_params
    params.permit(:user_id,)
  end
end
