class DashboardController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path unless current_user
    else
      @stats = current_user.fitbit_stats
    end
  end

end
