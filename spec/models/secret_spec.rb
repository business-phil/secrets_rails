require 'rails_helper'

RSpec.describe Secret, type: :model do
    it 'requires content' do
        secret = Secret.new
        secret.valid?
        expect(secret.errors[:content].any?).to eq(true)
    end
    describe 'relationships' do
        it 'belongs to a user' do
            user = create_user
            secret = user.secrets.create(content: 'secret 1')
        end
    end
end
