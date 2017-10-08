class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login!

  def sign_in_partial
  end

  def sign_up_partial
    @user = User.new
  end
  # def go_to_twitter
  #   # query = {
  #   #   "method"     => "neworder",
  #   #   "nonce"      => 1404996028,
  #   #   "order_type" => "buy",
  #   #   "quantity"   => 1,
  #   #   "rate"       => 1
  #   # }
  #   headers = {
  #     "key"  => "05vsmea7C8gOT4sHu3H9OIhtr"
  #   }
  #
  #   HTTParty.post(
  #     "api.twitter.com/1.1/statuses/update.json?include_entities=true",
  #     # :query => query,
  #     :headers => headers
  #   )
  #
  # end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to posts_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def callbacks
    binding.pry
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
