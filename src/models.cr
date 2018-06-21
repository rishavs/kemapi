module Kemapi
    
    class Post < Granite::Base
        adapter pg

        field title :     String
        field content :   String
        field link :      String
        
        timestamps

        validate_min_length :title, 10
        validate_max_length :title, 255

    end

    class User < Granite::Base
        adapter pg

        field username :      String
        field password_hash : String
        
        timestamps

        validate_uniqueness :username
        validate_min_length :username, 3
        validate_max_length :username, 255

        validate_min_length :password_hash, 60
        validate_max_length :password_hash, 60

    end
end
