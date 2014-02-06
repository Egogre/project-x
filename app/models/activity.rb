class Activity 
  include ActiveModel::Model

  def self.make_request(user, date = DateTime.now)
    params = {
      "request" => {
      "uid" => user.uid,
      "secret" => user.secret,
      "token" => user.token, 
      "date" => date
    }}.to_query
    connection = Faraday.new
    response = connection.get "http://localhost:9292/api/v1/activity?#{params}"
    data = JSON.parse(response.body)
    Stats.new(user_id: user.id, steps: data["steps_on_date"], sleep: data["sleep_on_date"], date: date)
  end

end
