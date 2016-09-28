require 'rails_helper'

RSpec.describe 'displaying likes' do
    before do
        @user = create_user
        log_in @user
        @secret1 = @user.secrets.create(content:'a secret')
        @secret2 = @user.secrets.create(content:'another secret')
        Like.create(user:@user, secret:@secret1)
    end
    it 'displays unlike button for secrets already liked' do
        visit '/secrets'
        expect(page).to have_text(@secret1.content)
        expect(page).to have_text('1 like(s)')
        expect(page).to have_button('Unlike')
        expect(page).to have_text(@secret2.content)
        expect(page).to have_text('0 like(s)')
        expect(page).to have_button('Like')
    end
    it 'deletes like and displays the changes in both profile and secrets page' do
        visit '/secrets'
        click_button 'Unlike'
        expect(current_path).to eq('/secrets')
        expect(page).not_to have_button('Unlike')
        expect(page).not_to have_text('1 like(s)')
        visit "/users/#{@user.id}"
        expect(page).not_to have_text('1 like(s)')
    end
    it 'creates like and displays it both in profile and secrets page' do
        visit '/secrets'
        click_button 'Like'
        expect(current_path).to eq('/secrets')
        expect(page).not_to have_button('Like')
        expect(page).not_to have_text('0 like(s)')
        visit "/users/#{@user.id}"
        expect(page).not_to have_text('0 like(s)')
    end
end
