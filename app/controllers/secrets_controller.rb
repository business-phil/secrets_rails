class SecretsController < ApplicationController
  def index
      @secrets = Secret.all
  end

  def create
      secret = Secret.new(content:params[:content], user:User.find(session[:user_id]))
      if secret.save
          redirect_to "/users/#{session[:user_id]}"
      else
          redirect_to "/users/#{session[:user_id]}", alert: secret.errors.full_messages
      end
  end
end
