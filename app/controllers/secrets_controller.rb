class SecretsController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]
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

  def destroy
      secret = Secret.find(params[:id])
      secret.destroy if secret.user == current_user
      redirect_to "/users/#{current_user.id}"
  end
end
