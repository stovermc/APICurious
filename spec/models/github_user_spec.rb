require 'rails_helper'

describe GithubUser do
  context ".find_user" do
    it "returns user assocaited with given token" do
      token = ENV['github_user_token']
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
