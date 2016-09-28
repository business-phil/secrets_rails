class LikesController < ApplicationController
    before_action :require_login, only: [:create, :destroy]
    def create
        like = Like.new(user:current_user, secret:Secret.find(params[:id]))
        if like.save
            redirect_to "/secrets"
        else
            redirect_to "/secrets", alert: secret.errors.full_messages
        end
    end
    def destroy
        Like.where(secret:Secret.find(params[:id])).find_by_user_id(current_user.id).destroy
        redirect_to "/secrets"
    end
end
