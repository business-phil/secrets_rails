require 'rails_helper'

RSpec.describe 'create new secret' do
    it 'processes new secret form and redirects to user profile' do
        user = create_user
        log_in user
        fill_in 'content', with: 'My secret'
        click_button 'Create Secret'
        expect(current_path).to eq("/users/#{ user.id }")
        expect(page).to have_text("My secret")
    end
end
