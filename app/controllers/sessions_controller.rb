class SessionsController < ApplicationController
  def new
  end
  def login
      @user = User.find_by_email(params[:email])
      if @user
          if @user.authenticate(params[:password])
              session[:user_id] = @user.id
              redirect_to "/users/#{@user.id}"
          else
              redirect_to "/sessions/new", alert: ['Invalid password']
          end
      else
          redirect_to "/sessions/new", alert: ['Invalid email']
      end
  end
  def logout
      session[:user_id] = nil if session[:user_id]
      redirect_to '/sessions/new'
  end
end
