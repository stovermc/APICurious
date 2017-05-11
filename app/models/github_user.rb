class GithubUser
  attr_reader :avatar, :name, :login

  def initialize(attrs = {})
    @attrs         = attrs
    @avatar        = attrs[:avatar_url]
    @name          = attrs[:name]
    @login     = attrs[:login]
  end

  def self.find_user(token)
    raw_user = GithubService.user_by(token)
    new(raw_user)
  end

  def followers(token)
    GithubService.followers(token).map do |raw_follower|
      GithubUser.new(raw_follower)
      #Need to figure out what to do with this in the controller
    end
  end

  def starred_repos(token)
    GithubService.starred_repos(token).count
  end
end
