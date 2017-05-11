require 'rails_helper'

describe GithubService do
  context ".user_by", vcr: true do
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

    context ".starred_repos", vcr: true do
      it "returns raw starred_repos" do
        token = ENV['github_user_token']
        starred_repos = GithubService.starred_repos(token)

        expect(starred_repos.count).to eq 1
      end
    end

    context ".followers", vcr: true do
      it "returns raw followers" do
        token = ENV['github_user_token']
        followers = GithubService.followers(token)
        follower = followers.first

        expect(followers).to be_an Array
        expect(follower).to be_a Hash
        expect(followers.count).to eq 9
        expect(follower).to have_key(:login)
        expect(follower[:login]).to be_a String
      end
    end

    context ".following", vcr: true do
      it "returns raw followed users" do
        token = ENV['github_user_token']
        followed_users = GithubService.following(token)
        followed_user = followed_users.first

        expect(followed_users).to be_an Array
        expect(followed_user).to be_a Hash
        expect(followed_users.count).to eq 13
        expect(followed_user).to have_key(:login)
        expect(followed_user[:login]).to be_a String
      end
    end
  end
end
