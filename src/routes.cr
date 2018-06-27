module Kemapi

    res = {
        "status" => "none",
        "message" => "none"
    }

    get "/" do
        render "src/views/pages/Home.ecr", "src/views/Layout.ecr"
    end
    get "/about" do
        data = {"ongo": "bongo"}.to_json
        render "src/views/pages/About.ecr", "src/views/Layout.ecr"
    end
    get "/register" do
        render "src/views/pages/Register.ecr", "src/views/Layout.ecr"
    end
    post "/register" do |env|
        res = Actions::Auth.register (env)
        if res["status"] == "error" 
            render "src/views/pages/Register.ecr", "src/views/Layout.ecr"
        else
            pp res
            render "src/views/pages/Welcome.ecr", "src/views/Layout.ecr"
        end
    end

    get "/welcome" do
        render "src/views/pages/Welcome.ecr", "src/views/Layout.ecr"
    end

    get "/login" do
        render "src/views/pages/Login.ecr", "src/views/Layout.ecr"
    end

    # ------------------------------------------------
    #   Universal handlers
    # ------------------------------------------------

    before_all do |env|
        puts ""
        
        # reset the response object on every route change
        res = {
            "status" => "none",
            "message" => "none"
        }

    end

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