class User < ActiveRecord::Base
  has_many :foods
  has_many :stats
  has_one :goal

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["extra"]["access_token"].token
      user.secret = auth["extra"]["access_token"].secret
    end
  end

  def fitbit_stats
    @fitbit_status ||= Activity.make_request(self)
  end

  def user_goal
    @goal ||= Goal.where(user_id: self.id).first
  end

  def calorie_total_for(date)
    if todays_foods(date).empty?
      0
    else
      (todays_foods(date).collect { |food| food.calories }.inject(:+)).round(0)
    end
  end

  def protein_total_for(date)
    if todays_foods(date).empty?
      0
    else
      (todays_foods(date).collect { |food| food.protein }.inject(:+)).round(0)
    end
  end

  def fiber_total_for(date)
    if todays_foods(date).empty?
      0
    else
      (todays_foods(date).collect { |food| food.fiber }.inject(:+)).round(0)
    end
  end

  def fat_total_for(date)
    if todays_foods(date).empty?
      0
    else
      (todays_foods(date).collect { |food| food.fat }.inject(:+)).round(0)
    end
  end

  def carb_total_for(date)
    if todays_foods(date).empty?
      0
    else
      (todays_foods(date).collect { |food| food.carbs }.inject(:+)).round(0)
    end
  end

  def average_steps
    stats.average('steps').to_f
  end

  def average_sleep
    stats.average('sleep').to_f
  end

  def achievement
    @achievement ||= Achievement.new(self)
  end

  def todays_foods(date)
    foods.where(consumed_on: date)
  end


  def goal_color
    if steps_array.first > steps_array.last
      ['#76FA11', '#1E8CFA']
    else
      ['#1E8CFA', '#76FA11']
    end
  end

  def steps_array
    if user_goal.steps == 0
      [0,0]
    elsif user_goal.steps < fitbit_stats.steps
      [fitbit_stats.steps, 1]
    else
      [fitbit_stats.steps, (user_goal.steps - fitbit_stats.steps)]
    end
  end

  def sleep_array
    if user_goal.sleep == 0
      [0,0]
    elsif user_goal.sleep <= fitbit_stats.sleep
      [fitbit_stats.sleep, 0.01]
    else
      [fitbit_stats.sleep + 0.01, (user_goal.sleep - fitbit_stats.sleep)]
    end
  end

  def food_goals_array
    [user_goal.carbohydrates, user_goal.fat, user_goal.protein, user_goal.fiber]
  end

  def food_eaten_array
    [self.carb_total_for(Date.today), self.fat_total_for(Date.today), self.protein_total_for(Date.today), self.fiber_total_for(Date.today)]
  end


end
