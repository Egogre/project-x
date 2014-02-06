class Activity 
  include ActiveModel::Model

  def self.make_request(uid, secret, token)
    params = {
      "request" => {
      "uid" => uid,
      "secret" => secret,
      "token" => token
    }}.to_query
    connection = Faraday.new
    response = connection.get "http://localhost:9292/api/v1/activity?#{params}"
    data = JSON.parse(response.body)
    Stats.new(data["steps_on_date"], data["sleep_on_date"])
  end

end
