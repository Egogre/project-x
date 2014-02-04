class FitbitStats
  attr_reader :client

  def initialize(user)
    @client = Fitgem::Client.new({
      :consumer_key    => 'ee59ac70ceb04f2c90fb103d3f0ac969',
      :consumer_secret => '06ea4da5140e4a3e9ae1524d5f047ba4', 
      :token           => user.token,
      :secret          => user.secret,
      :user_id         => user.uid
      })
  end

  def sleep_on_date(date = "today")
    (client.sleep_on_date(date)["summary"]["totalMinutesAsleep"]) / 60
  end

  def activities_on_date(date = "today")
    client.activities_on_date(date)["summary"]["steps"]
  end
end
