require 'rails_helper'

describe "when a logged in user clicks on followers" do
  before do
    Capybara.app = Apicurious::Application
    stub_oauth
    visit '/'
    click_on "Login with Github"
  end

  scenario "they see thier followers avatars", vcr: true do
    click_on 'Followers'

    expect(page).to have_css("img[src='https://avatars3.githubusercontent.com/u/20036943?v=3']")
    expect(page).to have_css("img[src='https://avatars2.githubusercontent.com/u/5198260?v=3']")
  end
end
