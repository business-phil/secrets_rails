class UsersController < ApplicationController
     before_action :set_user, only: [:view, :edit, :update, :destroy]
     before_action :require_login, except: [:new, :create]
     before_action :require_correct_user, only: [:view, :edit, :update, :destroy]
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
  end

  def edit
  end

  def update
      if @user.update(email:params[:email], name:params[:name])
          redirect_to "/users/#{@user.id}"
      else
          redirect_to "/users/#{@user.id}/edit", alert:@user.errors.full_messages
      end
  end

  def destroy
      session[:user_id] = nil if session[:user_id]
      @user.destroy
      redirect_to "/sessions/new"
  end

  private
  def set_user
      @user = User.find(params[:id])
  end
end
