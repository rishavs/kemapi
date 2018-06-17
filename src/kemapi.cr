require "kemal"
# require "sentry-run"
require "dotenv"
require "pg"
require "granite/adapter/pg"
require "crypto/bcrypt/password"

puts "Setting up the app ..."

puts "Reading env config"
Dotenv.load

puts "Initializing Database"


require "./models/*"
require "./routes/*"

module Kemapi

    # User.migrator.drop_and_create
    # Post.migrator.drop_and_create

    # get "/" do |env|

    #     {
    #         status: "success",
    #         data:   "Hello World"
    #     }.to_json

    # end
    
    # opts = Sentry.config(
    #     process_name: "kemapi",
    #     build_command: "crystal",
    #     run_command: "./bin/kemapi",
    #     build_args: ["build", "src/kemapi.cr", "-o", "bin/kemapi"],
    #     run_args: ["-p", "4321"]
    #     )
      
    # Sentry.run(opts) do
    #     Kemal.run
    # end

    Kemal.run
end
