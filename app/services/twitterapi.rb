require "httparty"
class Twitterapi

  ##utilizing the twitter gem
  def initialize
    api_key = '05vsmea7C8gOT4sHu3H9OIhtr'
    api_secret = "QAuaAtxagVfksNjzklo2TG11vGzkAaSc8R7rSQX42yjo2vS4ab"
    ##will be current_user.access_token
    access_token = "2613734754-TER8zCABuodD7nhJlnccfE8cQctFDopDLjcBQw5"
    access_token_secret = "y0cwDz3SL7dJgRdEkS6W8kWk31pgZ83xUKaYtTm2uzqV4"

    @twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = api_key
      config.consumer_secret     = api_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end

  end


  def get_timeline_posts user_handle
    ##rescue if user handle is bad or has no posts
    begin
      posts = @twitter_client.user_timeline(user_handle)
    rescue => ex
      posts = []
    end

  end



end
