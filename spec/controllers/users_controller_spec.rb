require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
        @user = create_user
    end
    describe 'when not logged in' do
        before do
            session[:user_id] = nil
        end
        it 'cannot access show' do
            get :view, id: @user
            expect(response).to redirect_to('/sessions/new')
        end
        it 'cannot access edit' do
            get :edit, id: @user
            expect(response).to redirect_to('/sessions/new')
        end
        it 'cannot access update' do
            get :update, id: @user
            expect(response).to redirect_to('/sessions/new')
        end
        it 'cannot access destroy' do
            get :destroy, id: @user
            expect(response).to redirect_to('/sessions/new')
        end
    end
    describe 'when signed in as the wrong user' do
        before do
            @wrong_user = create_user 'erica', 'erica@lacy.com'
            session[:user_id] = @wrong_user.id
        end
        it 'cannot access edit page for another user' do
            get :edit, id: @user
            expect(response).to redirect_to("/users/#{@wrong_user.id}")
        end
        it 'cannot edit another user' do
            get :update, id: @user
            expect(response).to redirect_to("/users/#{@wrong_user.id}")
        end
        it 'cannot destroy another user' do
            get :destroy, id: @user
            expect(response).to redirect_to("/users/#{@wrong_user.id}")
        end
    end
end
