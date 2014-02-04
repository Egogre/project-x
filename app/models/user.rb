class User < ActiveRecord::Base
  has_many :foods
  has_many :goals

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
    FitbitStats.new(self)
  end

  def user_goal
    Goal.where(user_id: self.id).first
  end

  def daily_calorie_total
    (foods.collect { |food| food.calories }.inject(:+)).round(0)
  end

  def daily_protein_total
    (foods.collect { |food| food.protein }.inject(:+)).round(0)
  end

  def daily_fat_total
    (foods.collect { |food| food.fat }.inject(:+)).round(0)
  end

  def daily_carb_total
    (foods.collect { |food| food.carbs }.inject(:+)).round(0)
  end

  def daily_fiber_total
    (foods.collect { |food| food.fiber }.inject(:+)).round(0)
  end

end
