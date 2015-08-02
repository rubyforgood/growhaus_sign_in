class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    
    email = request.env['omniauth.auth'].info.email
    non_growhaus_authenticated_user_emails = ['geekprogrammer.ed@gmail.com', 'rlwinter@gmail.com']
    is_authorized = email.ends_with?('@growhaus.org') || non_growhaus_authenticated_user_emails.include?(email)

    unless is_authorized
      redirect_to root_path
      return
    end

    user = Staff.find_or_create_from_auth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

