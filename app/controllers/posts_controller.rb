class PostsController < ApplicationController

  #root path
  def index
  end


  ##from an ajax call
  def search
    ##twitter gem. intitialize client and get posts from twitter handle input by user
    twitter_api = Twitterapi.new
    posts = twitter_api.get_timeline_posts(params["twitterHandle"])
    ##make sure they are posts that have not been read
    @posts = PostsHelper.get_good_posts(posts, current_user.id)
  end

  ##from an ajax call
  def mark_as_read
    ##find or create post in db. add relation so future searches won't include this
    post = Post.find_or_create_by(tweet_id: params["tweetId"])
    PostsUsers.create(post_id: post.id, user_id: current_user.id, tweet_id: post.tweet_id)
  end





end
