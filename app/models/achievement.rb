class Achievement
  include ActiveModel::Model

  def initialize(user)
    @user = user
  end

  def goal
    @goal ||= Goal.first_or_create(user_id: @user.id)
  end

  def todays_stats
    @user.stats.last
  end

  def steps_percentage
    goal.steps == 0 ? 0 : (todays_stats.steps.to_f / goal.steps.to_f * 100).round(1)
  end

  def sleep_percentage
    goal.sleep == 0 ? 0 : (todays_stats.sleep / goal.sleep * 100).round(1)
  end

  def sleep_short_pretty
    sec_short = (goal.sleep - todays_stats.sleep)*3600
    Time.at(sec_short).utc.strftime("%k:%M")
  end

  def calories_percentage
    goal.calories == 0 ? 0 : (@user.calorie_total_for(Date.today).to_f / goal.calories * 100).round(1)
  end

  def carbs_percentage
    goal.carbohydrates == 0 ? 0 : (@user.carb_total_for(Date.today).to_f / goal.carbohydrates * 100).round(1)
  end

  def fat_percentage
    goal.fat == 0 ? 0 : (@user.fat_total_for(Date.today).to_f / goal.fat * 100).round(1)
  end

  def protein_percentage
    goal.protein == 0 ? 0 : (@user.protein_total_for(Date.today).to_f / goal.protein * 100).round(1)
  end

  def fiber_percentage
    goal.fiber == 0 ? 0 : (@user.fiber_total_for(Date.today).to_f / goal.fiber * 100).round(1)
  end

end
