module Kemapi::Actions
    class Posts
        def self.create (env)
            post = Post.new
            begin
                auth_token = env.response.headers["Authorization"]
                author = Actions::Auth.parse_jwt_token(auth_token)

                post.title          = env.params.json["title"].as(String)
                post.content        = env.params.json["content"].as(String)
                post.link           = env.params.json["link"].as(String)
                post.thumb          = env.params.json["thumb"].as(String)
                post.thumb          = env.params.json["thumb"].as(String)
                post.author         = author.username

                post.save!
            rescue ex : JSON::ParseException
                env.response.status_code = 400
            rescue ex : TypeCastError | KeyError
                env.response.status_code = 422
            else
                pp "added post"
                pp post

                if post.errors.size > 0
                    env.response.status_code = 422

                    {   "status": "error",
                        "message": "ERROR: 422 Unprocessable Entity",
                        "details": post.errors[0].message
                    }.to_json
                else
                    {   "status": "success",
                        "message": "Post was inserted into the database",
                        "data": {"unqid": post.unqid, "title": post.title}
                    }.to_json
                end
            end

        end

    end
end