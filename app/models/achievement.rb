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
    goal.steps == 0 ? 0 : (todays_stats.steps.to_f / goal.steps.to_f) * 100
  end

  def sleep_percentage
    goal.sleep == 0 ? 0 : (todays_stats.sleep.to_f / goal.sleep.to_f) * 100
  end

end
