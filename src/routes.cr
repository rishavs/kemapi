module Kemapi

    # get "/" do |env|
    #     # {status: "success", data: "Hello World"}.to_json
    #     err_content = {"status" => "error", "message" => "ERROR: 422 Unprocessable Entity", "details" => "cccc"}
    #     halt env, status_code: 403, response: err_content.to_json
    # end
    get "/" do
        render "src/views/pages/Home.ecr", "src/views/Layout.ecr"
    end
    get "/about" do
        render "src/views/pages/About.ecr", "src/views/Layout.ecr"
    end
    get "/register" do
        render "src/views/pages/Register.ecr", "src/views/Layout.ecr"
    end
    post "/controllers/register" do |env|
        pp env
        username = env.params.body["username"].as(String)
        password = env.params.body["password"].as(String)
        "#{username} has password #{password}"
    end

    get "/login" do
        render "src/views/pages/Login.ecr", "src/views/Layout.ecr"
    end

      
    # post "/api/auth/register/" do |env|
    #     Actions::Auth.register (env)
    # end

    # post "/api/auth/login" do |env|
    #     Actions::Auth.login (env)
    # end

    # options "/api/auth/login" do |env|
    #     env.response.headers["Access-Control-Allow-Origin"] = "*"
    #     env.response.headers["Content-Type"] = "application/json"
    # end


    # get "/api/users/" do |env|
    #     Actions::Users.list(env)
    
    # end

    # post "/api/posts/" do |env|
    #     Actions::Posts.create(env)
    # end

    # get "/api/posts/" do |env|
    #     Actions::Posts.list(env)
    # end


    # ------------------------------------------------
    #   Universal handlers
    # ------------------------------------------------

    # before_all do |env|
    #     puts ""
    #     # env.response.content_type = "application/json"
    # end

    # after_all do |env|
    #     puts ""
    #     # env.response.content_type = "application/json"
    # end

    # ------------------------------------------------
    #   Error catchalls
    # ------------------------------------------------

    # error 400 do |env|
    #     { "status": "error",
    #         "message": "ERROR: 400 Bad Request",
    #         "details": "Check the input data format" }.to_json
    # end

    # error 401 do |env|
    #     { "status": "error", 
    #         "message": "ERROR: 401 Unauthorized Request." ,
    #         "details": "You need to be authenticated to use this resource"}.to_json
    # end

    # error 403 do |env|
    #     { "status": "error",
    #         "message": "ERROR: 403 Forbidden." ,
    #         "details": "You may not be authorized to access a this resource"}.to_json
    # end

    # error 404 do |env|
    #     { "status": "error",
    #         "message": "ERROR: 404 Not Found",
    #         "details": "Check the URL used"}.to_json
    # end

    # error 422 do |env|
    #     { "status": "error",
    #         "message": "ERROR: 422 Unprocessable Entity",
    #         "details": "Check the input data for invalid entries" }.to_json
    # end

    # error 500 do |env|
    #     { "status": "error", 
    #         "message": "ERROR: 500 Internal Server Error",
    #         "details": "This exception is not yet explicitly handled. Reach out to the dev." }.to_json
    # end

end