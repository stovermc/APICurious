class GithubService
  def initialize
    @conn = Faraday.new('https://api.github.com')
  end

  def self.starred_repos(token)
    service = GithubService.new
    service.starred_repos(token)
  end

  def starred_repos(token)
    response = @conn.get '/user/starred', { access_token: token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_by(token)
    service = GithubService.new
    service.user_by(token)
  end

  def user_by(token)
    response = @conn.get '/user', { access_token: token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred_repos(token)
    service = GithubService.new
    service.starred_repos(token)
  end

  def starred_repos(token)
    response = @conn.get '/user/starred', { access_token: token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(token)
    service = GithubService.new
    service.followers(token)
  end

  def followers(token)
    response = @conn.get '/user/followers', { access_token: token }
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.following(token)
    service = GithubService.new
    service.following(token)
  end

  def following(token)
    response = @conn.get '/user/following', { access_token: token }
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn
end
