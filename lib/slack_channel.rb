class SlackChannel
  class SlackException < RuntimeError
  end

  BASE_URL = "https://slack.com/api/"

  attr_reader :name

  def initialize(name)
    @name = name
    # @raw_data = data
  end

  def send(message)
    # URL from Slack API: https://slack.com/api/chat.postMessage
    # have to go look up SLACK to find the postMessage URL
    query_params = {
                      "token" => ENV["SLACK_API_TOKEN"],
                      "channel" => @name,
                      "text" => message,
                      "username" => "Dancing-Corgi",
                      "icon_emoji" => ":dancing_corgi:",
                      "as_user" => "false"
                   }

    url = "#{BASE_URL}chat.postMessage"
    response = HTTParty.post(url, query: query_params)
    if response["ok"]
      puts "Your message has been posted"
    else
      raise SlackException.new(response["error"])
    end
  end

  # list all the channels
  # full URL from Slack API doc: https://slack.com/api/channels.list
  def self.all
    url = "#{BASE_URL}channels.list?token=#{ENV["SLACK_API_TOKEN"]}"
    response = HTTParty.get(url).parsed_response
    if response["ok"]
       channel_list = []
       response["channels"].each do |channel_data|
         channel_list << self.new(channel_data["name"])
       end
       return channel_list
    else
      raise SlackException.new(response["error"])
    end
  end
end
