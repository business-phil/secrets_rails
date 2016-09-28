require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    before do
        @user = create_user
        @secret = @user.secrets.create(content:'a secret')
        @like = Like.create(user:@user, secret:@secret)
    end
    describe 'when not logged in' do
        before do
            session[:user_id] = nil
        end
        it 'cannot like secrets' do
            get :create, id: @secret
            expect(response).to redirect_to('/sessions/new')
        end
        it 'cannot unlike/destroy secrets' do
            get :destroy, id: @secret
            expect(response).to redirect_to('/sessions/new')
        end
    end
end
