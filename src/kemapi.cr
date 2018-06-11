require "kemal"
require "sentry-run"
require "dotenv"
require "pg"

require "./kemapi/*"
require "./models/*"
require "./Schemancer/*"

module Kemapi
    
    Dotenv.load

    u2 = User.new "Pooka"
    # u2.name = "Shirley"
    puts u2.name 

        Schemancer::square(5)
        

    before_all do |env|
        puts "Setting response content type"
        env.response.content_type = "application/json"
      end

    get "/" do |env|
        # Schema.validate()

        res = {
            status: "success",
            data: "Hello World"
        }.to_json

        res
    end
  
    process = Sentry.config(
        process_name: "kemapi",
        build_command: "crystal",
        run_command: "./bin/kemapi",
        build_args: ["build", "src/kemapi.cr", "-o", "bin/kemapi"],
        run_args: ["-p", "4321"])
      
    Sentry.run(process) do
        Kemal.run
    end
end
