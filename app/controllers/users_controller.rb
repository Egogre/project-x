class UsersController < ApplicationController

  def show
    @user = current_user
    @goal = @user.user_goal
  end

end
