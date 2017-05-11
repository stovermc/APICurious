require 'rails_helper'

describe GithubUser do

  attr_reader :token, :stubbed_response
  before do
    @token = ENV['github_user_token']
    @stubbed_response = {
      :login=>"stovermc",
      :id=>15877604,
      :avatar_url=>"https://avatars0.githubusercontent.com/u/15877604?v=3",
      :followers_url=>"https://api.github.com/users/stovermc/followers",
      :following_url=>"https://api.github.com/users/stovermc/following{/other_user}",
      :starred_url=>"https://api.github.com/users/stovermc/starred{/owner}{/repo}",
      :subscriptions_url=>"https://api.github.com/users/stovermc/subscriptions",
      :organizations_url=>"https://api.github.com/users/stovermc/orgs",
      :repos_url=>"https://api.github.com/users/stovermc/repos",
      :name=>"Mark Stover",
      :public_repos=>33,
      :public_gists=>5,
      :followers=>8,
      :following=>13 }
      allow_any_instance_of(GithubService).to receive(:user_by).with(token).and_return(stubbed_response)
  end

  context ".find_user" do
    it "returns user assocaited with given token" do
      user = GithubUser.find_user(token)

      expect(user.class).to be(GithubUser)
      expect(user.avatar).to eq "https://avatars0.githubusercontent.com/u/15877604?v=3"
      expect(user.name).to eq('Mark Stover')
    end
  end

  context "#profile_pic" do
    it "returns users avatar" do
      user = GithubUser.find_user(token)

      expect(user.avatar).to eq('https://avatars0.githubusercontent.com/u/15877604?v=3')
    end
  end

  context "#starred_repos" do
    it "returns all starred repos for a user" do
      stub_starred_repos = [{name: 'APICurious'}]
      allow_any_instance_of(GithubService).to receive(:starred_repos).with(token).and_return(stub_starred_repos)
      user = GithubUser.find_user(token)
      starred_repos = user.starred_repos(token)

      expect(starred_repos).to eq 1
    end
  end

  context "#followers" do
    it "returns all of a users followers" do
      followers= [{login: 'Sadie'}, {login: 'Porter'}]
      allow_any_instance_of(GithubService).to receive(:followers).with(token).and_return(followers)
      user = GithubUser.find_user(token)
      top_follower = user.followers(token).first

      expect(top_follower[:login]).to eq 'Sadie'
    end
  end
end
