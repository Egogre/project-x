class DashboardController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path unless current_user
    else
      @stats = current_user.fitbit_stats
      @user = current_user
      @goal = current_user.goals[0] || Goal.new
    end
  end

end
