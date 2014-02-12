class UsersController < ApplicationController

  def show
    @user = current_user
    @goal = current_user.goal
  end

end
