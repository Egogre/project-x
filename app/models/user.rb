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
    # data = UserFitbitData.new(user)
    # data.sleep(date)
    # client = Fitgem::Client.new({:consumer_key => 'ee59ac70ceb04f2c90fb103d3f0ac969', :consumer_secret => '06ea4da5140e4a3e9ae1524d5f047ba4', :token => token, :secret => secret, :user_id => uid})
    FitbitStats.new(self)
    # p client.sleep_on_date('today')["summary"]["totalMinutesAsleep"]
  end
end
