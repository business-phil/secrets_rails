require 'rails_helper'

RSpec.describe 'new secret' do
    it 'user profile includes form to create new secret' do
        user = create_user
        log_in user
        expect(page).to have_field('content')
        expect(page).to have_button('Create Secret')
    end
end
