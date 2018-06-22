module Kemapi::Actions
    class Posts
        def self.create (env)
            post = Post.new

            auth_token = env.request.headers["Authorization"]
            author = Actions::Auth.parse_jwt_token(auth_token)

            pp "author is"
            pp author

            post.title          = env.params.json["title"].as(String)
            post.content        = env.params.json["content"].as(String)
            post.link           = env.params.json["link"].as(String)
            post.thumb          = env.params.json["thumb"].as(String)
            post.author         = author["username"].to_s

            post.save

            if post.errors.size > 0
                pp post.errors
                env.response.status_code = 422

                {   "status": "error",
                    "message": "ERROR: 422 Unprocessable Entity",
                    "details": post.errors[0].field.to_s + " " + post.errors[0].message.to_s
                }.to_json
            else
                
                pp "added post"
                pp post
                
                {   "status": "success",
                    "message": "Post was inserted into the database",
                    "data": {"unqid": post.unqid, "title": post.title}
                }.to_json
            end

        end

    end
end