ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "minitest/pride"
require "rack/test"
require "./app"

class RepoDepotTest < MiniTest::Test

  include Rack::Test::Methods

  def app
    RepoDepot
  end

  def test_root_route
    response = get "/"
    assert_includes response.body, "repository"
  end

  def test_repo_route
    response = post "/get_repo", "user_name" => "austenlockwood"
    assert_includes response.body, "12_days"
  end

end
