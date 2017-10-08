class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  ## get twitter posts by user handle paramater
  def index
    ##sort posts read and unread here or conditional on view?
    @posts = Post.all
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {})
    end
end
