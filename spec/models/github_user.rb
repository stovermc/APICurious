require 'rails-helper'

describe GithubUser do
  context ".find_user" do
    it "returns user that matches a filter" do
      token = { token: '3ac7b680519f8caa2aafa84cc5af805eece53b7e' }
      user = GithubUser.find_user(token)

      expect(user.count).to eq(1)
      expect(user.name).to eq('Mark Stover')
      expect(user.followers.count).to eq(7)
      expect(user.following.count).to eq(12)


    end
  end
end
