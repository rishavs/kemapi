module Kemapi::Actions

    class Auth
    
        def self.register (env)
            uname = env.params.json["username"].as(String)
            pass = env.params.json["password"].as(String)
            pass_hash = Crypto::Bcrypt::Password.create(pass)

            new_user = User.new(username: uname, password_hash: pass_hash.to_s)
            new_user.save

            if new_user.errors.size > 0
                env.response.status_code = 422

                {   "status": "error",
                    "message": "ERROR: 422 Unprocessable Entity",
                    "details": new_user.errors[0].message
                }.to_json
            else
                {   "status": "success",
                    "message": "User was inserted into the database",
                    "data": {"unqid": new_user.unqid, "username": new_user.username}
                }.to_json
            end

        end

        def self.login(env)
            uname = env.params.json["username"].as(String)
            pass = env.params.json["password"].as(String)

            user = User.find_by(username: uname)

            pass_hash = Crypto::Bcrypt::Password.create(pass).to_s

            if user && Crypto::Bcrypt::Password.new(user.password_hash.not_nil!) == pass
                puts "The password matches"

                pp user
                token = generate_jwt_token(user.unqid, user.username)
                {   "status": "success",
                    "message": "Password was succesfully verified",
                    "data": token
                }.to_json
            else
                puts "The password doesnt matches"
                {   "status": "error",
                    "message": "Password is wrong"
                }.to_json
            end
        end

        def self.generate_jwt_token (uid, uname)
            exp = Time.now.epoch + 6000000
            payload = { "unqid" => uid, "username" => uname, "exp" => exp }
            token = JWT.encode(payload, ENV["SECRET_JWT"], "HS256")
        end

        def self.parse_jwt_token (token)
            payload, header = JWT.decode(token, ENV["SECRET_JWT"], "HS256")

            user = { "unqid" => payload["unqid"], "username" => payload["username"]}
        end
    end
end