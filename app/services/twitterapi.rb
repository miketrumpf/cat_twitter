require "httparty"
class Twitterapi

  ##utilizing the twitter gem
  def initialize
    api_key = ENV["TWITTER_API_KEY_ID"]
    api_secret = ENV["TWITTER_API_SECRET"]
    ##will be current_user.access_token
    access_token = ENV["TWITTER_ACCESS_TOKEN"]
    access_token_secret = ENV["TWITTER_ACCESS_SECRET_TOKEN"]

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
