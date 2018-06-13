require "kemal"
require "sentry-run"
require "dotenv"
require "pg"
require "granite/adapter/pg"

Dotenv.load

require "./models/*"

module Kemapi

    # User.migrator.drop_and_create
    # Post.migrator.drop_and_create

    before_all do |env|
        puts "Setting response content type"
        env.response.content_type = "application/json"
    end

    get "/" do |env|

        res = {
            status: "success",
            data:   "Hello World"
        }.to_json

        res
    end
    
    get "/users/" do |env|
        puts User.all

    end

    post "/users/" do |env|
        uname = env.params.json["username"].as(String)
        pass = env.params.json["password_hash"].as(String)

        Post.create(username: uname, password_hash: pass)

    end

    opts = Sentry.config(
        process_name: "kemapi",
        build_command: "crystal",
        run_command: "./bin/kemapi",
        build_args: ["build", "src/kemapi.cr", "-o", "bin/kemapi"],
        run_args: ["-p", "4321"]
        )
      
    Sentry.run(opts) do
        Kemal.run
    end
end
