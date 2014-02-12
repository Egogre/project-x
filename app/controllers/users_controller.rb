class UsersController < ApplicationController

  def show
    @user = current_user
    @goal = current_user.goal
    @days = @user.achievement.last_seven_day_labels
  end

end
