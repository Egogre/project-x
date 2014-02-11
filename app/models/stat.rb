class Stat < ActiveRecord::Base
  belongs_to :user

  def sleep_pretty
    Time.at(sleep*3600).utc.strftime("%k:%M")
  end

end
