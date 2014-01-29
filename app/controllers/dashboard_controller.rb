class DashboardController < ApplicationController

  def index
    redirect_to login_path unless current_user
    if current_user
      @stats = current_user.fitbit_stats
    end
  end
end
