class UserController < ApplicationController

  def create
    user = User.create(first_name: params["first_name"], last_name: params["last_name"])
    puts user.id
    redirect_to "/welcome/#{user.id}"
  end

  def home
    @user = User.find(params[:id])
  end

  def page
    @user = User.find(params[:id])
    @user_gossips = @user.gossips
  end

end
