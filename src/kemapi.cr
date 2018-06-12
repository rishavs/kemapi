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
    # default_request
  # default reply
    #     case reply.status

    #         3xx: {

    #         }
    #         401: {

    #         }
    # end

    get "/" do |env|
        # Schema.validate()

        res = {
            status: "success",
            data: "Hello World"
        }.to_json

        res
    end

    # get "/test_api" do |env|
    #     Request = {
    #         header:
    #         body: {
    #             username:         Schema::users.username,
    #             password_hash:    Schema::users.password.hash
    #             role:             Schema:company.role

    #         }

    #     }
    # before_handle = validate_auth
    # validate.request(Request)
    #     Handlers = optional. functions that run everytime this request comes.
    #   after_handle =
    #     Reply = {
            # for each status code. if already defined in all_methods, just overwide that.

    #     }
    

    # end
  
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
