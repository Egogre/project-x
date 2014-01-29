class User < ActiveRecord::Base

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
  
end
