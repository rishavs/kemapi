require "kemal"
require "sentry-run"
require "dotenv"
require "pg"
require "granite/adapter/pg"
require "crypto/bcrypt/password"

Dotenv.load

require "./models/*"

module Kemapi

    User.migrator.drop_and_create
    Post.migrator.drop_and_create

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
        pass = env.params.json["password"].as(String)
        pass_hash = Crypto::Bcrypt::Password.create(pass)

        new_user = User.new(username: uname, password_hash: pass_hash.to_s)
        new_user.save

        if new_user.errors.size > 0
            new_user.errors.each do |err|
                puts err
            end
        else
            puts "No error detected"
        end

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
