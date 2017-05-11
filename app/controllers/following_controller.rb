class FollowingController < ApplicationController
  def index
    github_user = GithubUser.find_user(current_user.oauth_token)
    @followed_users = github_user.following(current_user.oauth_token)
  end
end
