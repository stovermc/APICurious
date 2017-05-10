require 'rails_helper'

describe "when user logs in" do
  before do
    Capybara.app = Apicurious::Application
    stub_oauth

    token = ENV['github_user_token']
    stubbed_response = {:login=>"stovermc", :id=>15877604, :avatar_url=>"https://avatars0.githubusercontent.com/u/15877604?v=3", :followers_url=>"https://api.github.com/users/stovermc/followers", :following_url=>"https://api.github.com/users/stovermc/following{/other_user}", :starred_url=>"https://api.github.com/users/stovermc/starred{/owner}{/repo}", :subscriptions_url=>"https://api.github.com/users/stovermc/subscriptions", :organizations_url=>"https://api.github.com/users/stovermc/orgs", :repos_url=>"https://api.github.com/users/stovermc/repos", :name=>"Mark Stover", :public_repos=>33, :public_gists=>5, :followers=>8, :following=>13 }

    allow_any_instance_of(GithubService).to receive(:user_by).with(token).and_return(stubbed_response)
    user = GithubUser.find_user(token)
    context "the see all their profile picture", vcr: true do
      visit '/'
      click_on "Login with Github"

      expect(page).to have_css('.profile_pic')
    end
  end
end
