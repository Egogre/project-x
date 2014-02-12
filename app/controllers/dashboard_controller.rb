class DashboardController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path unless current_user
    else
      @stats = current_user.fitbit_stats
      @user = current_user
      @goal = current_user.goal
      @food = current_user.foods.where(consumed_on: Date.today)
    end
  end

end
