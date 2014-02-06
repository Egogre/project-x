class Goal < ActiveRecord::Base
  belongs_to :user
  after_initialize :set_defaults

  def set_defaults
    self.steps ||= 0
    self.sleep ||= 0.0
    self.calories ||= 0
    self.fat ||= 0.0
    self.protein ||= 0.0
    self.carbohydrates ||= 0.0
    self.fiber ||= 0.0
  end

  def empty?
    steps == 0 &&
    sleep == 0.0 &&
    calories == 0 &&
    fat == 0.0 &&
    protein == 0.0 &&
    carbohydrates == 0.0 &&
    fiber == 0.0 
  end
  
end
