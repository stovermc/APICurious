class GithubUser
  def self.find_user(token)
    raw_user = GithubService.user_by(token)
    new(raw_user)
  end
end
