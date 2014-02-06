class Food < ActiveRecord::Base
  after_initialize :set_defaults

  def set_defaults
    self.fiber ||= 0.0
    self.carbs ||= 0.0
    self.protein ||= 0.0
    self.fat ||= 0.0
    self.calories ||= 0
  end
  

end
