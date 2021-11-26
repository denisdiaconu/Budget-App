require 'rails_helper'

RSpec.describe 'Group view', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.new(username: 'des', email: 'des@mail.com', password: '123456') }

  describe '#index' do
    before do
      Group.create(name: 'Fast Food',
                   icon: 'https://images.everyeye.it/img-singole/articolo-142081.jpg', user: user)
      sign_in user
      visit groups_path
    end

    context 'when rendering index page' do
      it { expect(page).to have_content('Group') }
      it { expect(page).to have_content('Fast Food') }
      it {
        expect(page).to have_css("img[src*='https://images.everyeye.it/img-singole/articolo-142081.jpg']")
      }
    end

    context 'click on the button' do
      it 'should render to #new page' do
        click_on 'New Group'
        expect(current_path).to eq(new_group_path)
      end
    end
  end
end
