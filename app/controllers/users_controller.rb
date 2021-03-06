class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  ############################################################
  def index
    @users = User.all
  end

  # GET /users/1
  ############################################################
  def show
    @user = User.find(params[:id])
  end

  # POST /users
  ############################################################
  def create
    # in order to create a user, you must supply an email and password in the payload
    params.require(:email)
    params.require(:password)
    @user = User.new(user_params)
    if !@user.save
        render json: @user.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /users/1
  ############################################################
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  ############################################################
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user).permit(:email, :password, :auth_token)
      params.permit(:user, :email, :password, :auth_token)
    end
end
