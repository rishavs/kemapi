module Kemapi
    class User < Granite::Base
        adapter pg

        field username :      String
        field password_hash : String
        
        timestamps

        # validate_uniqueness :username
        validate_min_length :username, 3
        validate_max_length :username, 255

        validate_min_length :password_hash, 60
        validate_max_length :password_hash, 60

    end
end
