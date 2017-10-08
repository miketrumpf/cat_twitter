class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  ## get twitter posts by user handle paramater
  def index
    @posts = Post.all
  end

  ##make this js event that renders partial
  def search
    ##initialize twitter gem and get posts for twitter handle
    twitter_api = Twitterapi.new
    @posts = twitter_api.get_timeline_posts(params[:twitter_handle])
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  ##when user marks post as read create entry on join table user_id post_id via twitter
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end



end
