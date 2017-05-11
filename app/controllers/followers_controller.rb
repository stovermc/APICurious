class FollowersController < ApplicationController
  def index
    github_user = GithubUser.find_user(current_user.oauth_token)
    @followers = github_user.followers(current_user.oauth_token)
  end
end
