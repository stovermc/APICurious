class GithubUser
  attr_reader :profile_pic, :name, :starred_repos, :followers, :following

  def initialize(attrs = {})
    @attrs          = attrs
    @profile_pic   = attrs[:avatar_url]
    @name          = attrs[:name]
    @starred_repos = attrs[:starred_url]
    @followers     = attrs[:followers_url]
    @following     = attrs[:following_url]

  end


  def self.find_user(token)
    raw_user = GithubService.user_by(token)
    new(raw_user)
  end
end
