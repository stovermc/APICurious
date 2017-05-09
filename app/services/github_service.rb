class GithubService
  def initialize
    @conn = Faraday.new('https://api.github.com')
  end

  def self.user_by(token)
    service = GithubService.new
    service.user_by(token)
  end

  def user_by(token)
    byebug
    response = @conn.get '/legislators', { token: token }
  end

  private
    attr_reader :conn
end
