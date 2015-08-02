class PagesController < ApplicationController
  before_action :restrict_access, except: [:login]
  before_action :restrict_to_staff, except: [:login, :welcome]

  def welcome
    session[:welcome_mode] = true
  end
end
