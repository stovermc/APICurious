require 'rails_helper'

describe GithubService do
  context ".user_by" do
    it "returns a raw user" do
      token = ENV['github_user_token']
      user = GithubService.user_by(token)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:avatar_url)
      expect(user).to have_key(:name)
      expect(user).to have_key(:followers_url)
      expect(user).to have_key(:following_url)
      expect(user).to have_key(:starred_url)
      expect(user[:avatar_url]).to be_a(String)
      expect(user[:name]).to be_a(String)
      expect(user[:followers_url]).to be_a(String)
      expect(user[:following_url]).to be_a(String)
      expect(user[:starred_url]).to be_a(String)

    end

  end
end
