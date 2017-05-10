require 'rails_helper'

describe GithubUser do
  context ".find_user" do
    it "returns user assocaited with given token" do
      token = ENV['github_user_token']

      stubbed_response = {:login=>"stovermc", :id=>15877604, :avatar_url=>"https://avatars0.githubusercontent.com/u/15877604?v=3", :followers_url=>"https://api.github.com/users/stovermc/followers", :following_url=>"https://api.github.com/users/stovermc/following{/other_user}", :starred_url=>"https://api.github.com/users/stovermc/starred{/owner}{/repo}", :subscriptions_url=>"https://api.github.com/users/stovermc/subscriptions", :organizations_url=>"https://api.github.com/users/stovermc/orgs", :repos_url=>"https://api.github.com/users/stovermc/repos", :name=>"Mark Stover", :public_repos=>33, :public_gists=>5, :followers=>8, :following=>13 }

      allow_any_instance_of(GithubService).to receive(:user_by).with(token).and_return(stubbed_response)
      user = GithubUser.find_user(token)

      expect(user.class).to be(GithubUser)
      expect(user.profile_pic).to eq "https://avatars0.githubusercontent.com/u/15877604?v=3"
      expect(user.name).to eq('Mark Stover')
      expect(user.starred_repos).to eq "https://api.github.com/users/stovermc/starred{/owner}{/repo}"
      expect(user.followers).to eq "https://api.github.com/users/stovermc/followers"
      expect(user.following).to eq "https://api.github.com/users/stovermc/following{/other_user}"
    end
  end
end
