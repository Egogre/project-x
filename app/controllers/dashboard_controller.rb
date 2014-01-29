class DashboardController < ApplicationController
  def index
    @stats = current_user.fitbit_stats
  end
end
