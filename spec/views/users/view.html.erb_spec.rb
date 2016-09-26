require 'rails_helper'

RSpec.describe 'user profile page' do
    before do
        @user = create_user
        log_in @user
    end
    it 'displays information about the user' do
        expect(page).to have_text("#{@user.name}")
        expect(page).to have_link("Edit Profile")
    end
    it "displays a user's secrets on profile page" do
        secret = @user.secrets.create(content: 'secret')
        visit "/users/#{ @user.id }"
        expect(page).to have_text("#{ secret.content }")
    end
end
