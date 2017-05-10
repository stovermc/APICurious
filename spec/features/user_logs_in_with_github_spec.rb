require 'rails_helper'

RSpec.feature 'User can login with Github' do
  context 'existing user has valid credentials' do
    before do
      Capybara.app = Apicurious::Application
      stub_oauth
    end
    it 'logging in' do
      visit '/'
      expect(page.status_code).to eq(200)

      click_on "Login with Github"
      expect(current_path).to eq '/'
      expect(page).to have_content('Mark')
      expect(page).to have_link('Logout')
    end
  end
end
