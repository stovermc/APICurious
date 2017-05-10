class GithubService
  def initialize
    @conn = Faraday.new('https://api.github.com')
  end

  def self.user_by(token)
    service = GithubService.new
    service.user_by(token)
  end

  def user_by(token)
    response = @conn.get '/user', { access_token: token }
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn
end
