require 'httparty'
require 'pry'

class RepoClient
  include HTTParty
  base_uri 'api.github.com/users'

  def initialize(user)
    @user = user
  end


  def get_user_repo
    self.class.get("/#{@user}/repos") #    .json
  end

  def return_user_repo
    get_user_repo
  end
end
