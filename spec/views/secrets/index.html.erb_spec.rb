require 'rails_helper'

RSpec.describe 'user profile page' do
    before do
        @user = create_user
        log_in @user
    end
    it "displays everyone's secrets" do
        user2 = create_user 'erica', 'erica@lacy.com'
        secret1 = @user.secrets.create(content: 'secret 1')
        secret2 = user2.secrets.create(content: 'secret 2')
        visit '/secrets'
        expect(page).to have_text(secret1.content)
        expect(page).to have_text(secret2.content)
    end
end
