require 'rails_helper'

describe "when a logged in user clicks on Following" do
  before do
    Capybara.app = Apicurious::Application
    stub_oauth
    visit '/'
    click_on "Login with Github"
  end

  scenario "they see the avatars of the users they follow", vcr: true do
    click_on "Following"

    expect(page).to have_css("img[src='https://avatars2.githubusercontent.com/u/5198260?v=3']")
    expect(page).to have_css("img[src='https://avatars3.githubusercontent.com/u/10079657?v=3']")
  end

  scenario "they see the username of the users they follow", vcr: true do
    click_on "Following"

    expect(page).to have_content('josh-works')
    expect(page).to have_content('VictoriaVasys')
  end
end
