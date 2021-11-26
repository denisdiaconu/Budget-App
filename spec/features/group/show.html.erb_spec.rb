require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.new(username: 'des', email: 'des@mail.com', password: '123456') }
  let(:group) do
    Group.create(name: 'Fast Food',
                 icon: 'https://images.everyeye.it/img-singole/articolo-142081.jpg', user: user)
  end
  let(:entity) { Entity.create(name: 'Pizza', amount: 10, user: user) }

  describe '#index' do
    before do
      sign_in user
      group.entities << entity
      visit group_path(group)
    end

    it { expect(page).to have_content('Credit') }
    it {
      expect(page).to have_css("img[src*='https://images.everyeye.it/img-singole/articolo-142081.jpg']")
    }
    it { expect(page).to have_content('Pizza') }
    it { expect(page).to have_content('10.0') }
  end
end
