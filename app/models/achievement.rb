class Achievement
  include ActiveModel::Model

  def initialize(user)
    @user = user
  end

  def goal
    @user.goal
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
    if sec_short <= 0
      sec_short = 0
    end
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

  def calorie_weekly_percent
    last_seven_days.map do |date|
      ((@user.calorie_total_for(date).to_f / goal.calories.to_f) * 100).round(0)
    end
  end

  def protein_weekly_percent
    if goal.protein == 0
      [0,0,0,0,0,0,0]
    else
      last_seven_days.map do |date|
        ((@user.protein_total_for(date) / goal.protein) * 100).round(0)
      end
    end
  end

  def fiber_weekly_percent
    if goal.fiber == 0
      [0,0,0,0,0,0,0]
    else
      last_seven_days.map do |date|
        ((@user.fiber_total_for(date) / goal.fiber) * 100).round(0)
      end
    end
  end

  def fat_weekly_percent
    if goal.fat == 0
      [0,0,0,0,0,0,0]
    else
      last_seven_days.map do |date|
        ((@user.fat_total_for(date) / goal.fat) * 100).round(0)
      end
    end
  end

  def carbs_weekly_percent
    if goal.carbohydrates == 0
      [0,0,0,0,0,0,0]
    else
      last_seven_days.map do |date|
        ((@user.carb_total_for(date) / goal.carbohydrates) * 100).round(0)
      end
    end
  end

  def last_seven_day_labels
    last_seven_days.map { |date| date.strftime('%A') }
  end

  def last_seven_days
    ((Date.today - 6)..Date.today)
    #date array of the last seven days
  end



end
