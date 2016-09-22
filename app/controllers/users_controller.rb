class UsersController < ApplicationController
  def new
  end

  def view
      @user = User.find(params[:id])
  end
end
