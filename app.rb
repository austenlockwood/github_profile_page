require "./dependencies"

class RepoDepot < Sinatra::Base

  get "/" do
    user = params["user_name"]

    ERB.new(File.read("./html/homepage.html.erb")).result(binding)
  end

  get "/cool.css" do
    File.read("./css/styles.css")
  end

  post "/get_repo" do
    user = params["user_name"]

    repo_list = RepoClient.new(user).get_user_repo
    ERB.new(File.read("./html/repository.html.erb")).result(binding)
  end


  run! if app_file == $PROGRAM_NAME
end
