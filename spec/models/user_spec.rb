require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: 'desss', email: 'des@mail.com', password: '123456') }

  before { user.save }

  describe 'assocciations' do
    it { should have_many(:entities) }
    it { should have_many(:groups) }
  end

  describe 'validations' do
    context 'with correct parameters' do
      it 'name, email, password should be present' do
        expect(user).to be_valid
      end
    end

    context 'with wrong parameters' do
      it 'email should be present' do
        user.email = nil
        expect(user).to_not be_valid
      end

      it 'email should not be too long' do
        user.email = 'des@mail.com' * 20
        expect(user).to_not be_valid
      end

      it 'password should not be too long' do
        user.password = 'mysicretpassword' * 10
        expect(user).to_not be_valid
      end
    end
  end
end
