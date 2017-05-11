class DashboardController < ApplicationController
  def index
    @github_user = GithubUser.find_user(current_user.oauth_token)
  end
end
