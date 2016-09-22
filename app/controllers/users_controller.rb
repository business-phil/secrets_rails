class UsersController < ApplicationController
  def new
  end

  def create
      @user = User.new(email:params[:email], name:params[:name], password:params[:password], password_confirmation:params[:password_confirmation])
      if @user.save
          session[:user_id] = @user.id
          redirect_to "/users/#{@user.id}"
      else
          redirect_to "/users/new", alert: @user.errors.full_messages
      end
  end

  def view
      @user = User.find(params[:id])
  end
end
