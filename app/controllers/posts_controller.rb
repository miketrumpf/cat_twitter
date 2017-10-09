class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  ## get twitter posts by user handle paramater
  def index
  end


  ##from an ajax call
  def search
    ##twitter gem. intitialize client and get posts from twitter handle input by user
    twitter_api = Twitterapi.new
    posts = twitter_api.get_timeline_posts(params["twitterHandle"])
    @posts = PostsHelper.get_good_posts(posts, current_user.id)
  end

  ##from an ajax call
  def mark_as_read
    ##create post in db. add relation so future searches won't include this
    post = Post.create(tweet_id: params["tweetId"])
    PostsUsers.create(post_id: post.id, user_id: current_user.id, tweet_id: post.tweet_id)
  end





end
