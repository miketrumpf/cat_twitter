class Twitterapi

  ##utilizing the twitter gem
  def initialize
    api_key = '45429112'
    api_secret = "fbc6b2b41130f55fb4243bed7bd4a66fa5559222"
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
    binding.pry
  end



end
