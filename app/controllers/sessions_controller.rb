class SessionsController < ApplicationController
  def new
  end
  def login
      @user = User.find_by_email(params[:email])
      if @user
          if @user.authenticate(params[:password])
              redirect_to "/users/#{@user.id}"
          else
              redirect_to "/sessions/new", alert: 'Invalid password'
          end
      else
          redirect_to "/sessions/new", alert: 'Invalid email'
      end
  end
end
