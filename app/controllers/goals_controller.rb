class GoalsController < ApplicationController

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @user = current_user
    @goal = Goal.new
  end

  def create
    @user = current_user
    @goal = Goal.first_or_create(user_id: @user.id)
    @goal.update_attributes(goal_params)
    redirect_to user_path(@user)
  end

  def update
    @user = current_user
    @goal = Goal.find(params[:id])
    @goal.update_attributes(goal_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = current_user
    @goal = Goal.find(params[:id])
    render :new
  end

  private

  def goal_params
      params.require(:goal).permit(:user_id,
                                    :steps,
                                    :sleep,
                                    :calories,
                                    :carbohydrates,
                                    :fat,
                                    :protein,
                                    :fiber)
  end

end
