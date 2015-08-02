class ActivitiesController < ApplicationController
  before_action :restrict_access
  before_action :restrict_to_staff, except: [:index]

  def index
    @user = User.find_by(id: activity_params["user_id"])
    if @user
      @activities = @user.role.activity
    else
      @activities = Activity.all
    end
    @locale = params["locale"]
  end

  private

  def activity_params
    params.permit(:user_id,)
  end
end
