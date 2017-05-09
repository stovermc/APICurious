require 'rails_helper'

describe GithubService do
  context ".user_by" do
    it "returns a raw user" do
      token = { token: '3ac7b680519f8caa2aafa84cc5af805eece53b7e' }
      user = GithubService.user_by(token)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:avatar_url)
      expect(user).to have_key(:name)
      expect(user).to have_key(:followers_url)
      expect(user).to have_key(:following_url)
      expect(user).to have_key(:starred_url)

    end

  end
end
