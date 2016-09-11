class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:oauth, :profile]

  def show
    @user = User.find(params[:id])

    render
  end

  def oauth
    Rails.logger.error("Auth: #{request.env['omniauth.auth']}")

    redirect_to current_user
  end

  def index
    @users = User.all
  end

  def profile
    @user = current_user
  end
end
