class DashboardController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path unless current_user
    else
      @stats = current_user.fitbit_stats
      @user = current_user
      @goal = Goal.first_or_create(user_id: @user.id)
    end
  end

end
