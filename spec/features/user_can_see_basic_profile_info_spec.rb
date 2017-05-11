require 'rails_helper'

describe "when user logs in" do
  scenario "they see their profile picture", vcr: true do
    Capybara.app = Apicurious::Application
    stub_oauth
    visit '/'
    click_on "Login with Github"

    expect(page).to have_css("img[src='https://avatars0.githubusercontent.com/u/15877604?v=3']")
  end
  scenario "they see their number of starred_repos", vcr: true do
    Capybara.app = Apicurious::Application
    stub_oauth
    visit '/'
    click_on "Login with Github"

    expect(page).to have_content('Stars 1')
  end

  scenario "they see their number of followers", vcr: true do
    Capybara.app = Apicurious::Application
    stub_oauth
    visit '/'
    click_on "Login with Github"

    expect(page).to have_content('Followers 9')
  end

  scenario "they see the number of users they  follow", vcr: true do
    Capybara.app = Apicurious::Application
    stub_oauth
    visit '/'
    click_on "Login with Github"

    expect(page).to have_content('Following 13')
  end
end
