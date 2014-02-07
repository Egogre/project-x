class DashboardController < ApplicationController

  def index
    if current_user.nil?
      redirect_to login_path unless current_user
    else
      @stats = current_user.fitbit_stats
      @user = current_user
      @goal = Goal.first_or_create(user_id: @user.id)

      #goals not set or are set at zero
      @no_calories_goal = @goal.calories.to_f == 0
      @no_carbohydrates_goal = @goal.carbohydrates.to_f == 0
      @no_fat_goal = @goal.fat.to_f == 0
      @no_protein_goal = @goal.protein.to_f == 0
      @no_fiber_goal = @goal.fiber.to_f == 0

      #percent toward attaining daily goal (actual divided by goal times 100) unless goal (denominator) is zero
      @calories_percentage = (@user.calorie_total_for(Date.today).to_f / @goal.calories.to_f * 100).round(0) unless @no_calories_goal
      @carbohydrates_percentage = (@user.carb_total_for(Date.today).to_f / @goal.carbohydrates.to_f * 100).round(0) unless @no_carbohydrates_goal
      @fat_percentage = (@user.fat_total_for(Date.today).to_f / @goal.fat.to_f * 100).round(0) unless @no_fat_goal
      @protein_percentage = (@user.protein_total_for(Date.today).to_f / @goal.protein.to_f * 100).round(0) unless @no_protein_goal
      @fiber_percentage = (@user.fiber_total_for(Date.today).to_f / @goal.fiber.to_f * 100).round(0) unless @no_fiber_goal
    end
  end

end
