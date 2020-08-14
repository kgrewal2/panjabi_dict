class HomepageController < ApplicationController
  def home
  end

  def save_profile
    current_user.first_name = params[:first_name]
    current_user.last_name  = params[:last_name]
    current_user.facebook   = params[:facebook]
    current_user.twitter    = params[:twitter]
    current_user.status     = params[:status]
    current_user.save
  end

end

