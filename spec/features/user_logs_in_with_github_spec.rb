require 'rails_helper'

RSpec.feature 'User can login with Github' do
  context 'with valid credentials', vcr: true do
    before do
      Capybara.app = Apicurious::Application
      stub_oauth
    end
    it 'logging in' do
      visit '/'
      expect(page.status_code).to eq(200)

      click_on "Login with Github"
      expect(current_path).to eq '/dashboard'
      expect(page).to have_content('Mark')
    end
  end
end
