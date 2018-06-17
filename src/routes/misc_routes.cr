module Kemapi
    
    before_all do |env|
        puts ""
        puts "........................................."

        env.response.content_type = "application/json"

        env.response.headers["Access-Control-Allow-Origin"] = "*"
        env.response.headers["Access-Control-Allow-Methods"] = "GET, HEAD, POST, DELETE"
        # env.response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
        env.response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    end

    get "/" do |env|

        {
            status: "success",
            data:   "Hello World"
        }.to_json

    end
    
    error 400 do |env|
        env.response.content_type = "application/json"

        { "status": "error",
            "message": "ERROR: 400 Bad Request",
            "hint": "Check the input data format" }.to_json
    end

    error 401 do |env|
        env.response.content_type = "application/json"
        { "message": "ERROR: 401 Unauthorized Request." ,
            "hint": "You need to be authenticated to use this resource"}.to_json
    end

    error 403 do |env|
        env.response.content_type = "application/json"
        { "message": "ERROR: 403 Forbidden." ,
            "hint": "You may not be authorized to access a this resource"}.to_json
    end

    error 404 do |env|
        env.response.content_type = "application/json"
        { "message": "ERROR: 404 Not Found",
            "hint": "Check the URL used"}.to_json
    end

    # error 422 do |env|
    #     env.response.content_type = "application/json"
    #     { "message": "ERROR: 422 Unprocessable Entity",
    #         "hint": "Check the input data for invalid entries" }.to_json
    # end

    error 500 do |env|
        env.response.content_type = "application/json"
        { "message": "ERROR: 500 Internal Server Error",
            "hint": "This exception is not yet explicitly handled. Reach out to the dev." }.to_json
    end
end