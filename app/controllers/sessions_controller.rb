class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :restrict_access, except: [:create]
  before_action :restrict_to_staff, except: [:create]

  def create
    email = request.env['omniauth.auth'].info.email
    return redirect_to login_path unless valid_email?(email)

    staff = Staff.find_or_create_from_auth(request.env["omniauth.auth"])
    return redirect_to login_path unless staff

    session[:user_id] = staff.id
    redirect_to staffs_path
  end

  def destroy
    Staff.destroy(session[:user_id])
    session.clear
    redirect_to login_path
  end

  private

  def valid_email?(email)
    email.end_with?('@' + ENV['ALLOW_DOMAIN']) ||
      ENV['ALLOW_EMAILS'].include?(email)
  end
end
