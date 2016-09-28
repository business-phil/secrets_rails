require 'rails_helper'

RSpec.describe 'creating likes' do
    before do
        @user = create_user
        log_in @user
        @user.secrets.create(content:'a secret')
    end
    it 'creates like and displays it on user profile and secrets page' do
        visit '/secrets'
        expect(page).to have_text('0 like(s)')
        click_button 'Like'
        expect(current_path).to eq('/secrets')
        expect(page).to have_text('1 like(s)')
        visit "/users/#{@user.id}"
        expect(page).to have_text('1 like(s)')
    end
end
