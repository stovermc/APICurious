require 'rails_helper'

describe GithubUser do
  context ".find_user" do
    it "returns user assocaited with given token" do
      token = { token: '3ac7b680519f8caa2aafa84cc5af805eece53b7e' }
      user = GithubUser.find_user(token)

      expect(user.count).to eq(1)
      expect(user.name).to eq('Mark Stover')
      expect(user.followers.count).to eq(7)
      expect(user.following.count).to eq(12)
      expect(user.starred_repos.count).to eq(1)

    end
  end
end
