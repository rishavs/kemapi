module Kemapi
    
    class Post < Granite::Base

        adapter pg

        field unqid :   String
        field title :   String
        field content : String
        field link :    String
        field author :  String
        field thumb :   String
        timestamps

        before_create :assign_unqid
        def assign_unqid
            @unqid = UUID.random.to_s
        end
        
        validate_uniqueness :unqid
        validate_min_length :title, 3
        validate_max_length :title, 255

    end

    class User < Granite::Base

        adapter pg

        field unqid :           String
        field username :        String
        field password_hash :   String
        timestamps

        before_create :assign_unqid
        def assign_unqid
            @unqid = UUID.random.to_s
        end

        validate_uniqueness :unqid
        validate_uniqueness :username
        validate_min_length :username, 3
        validate_max_length :username, 255

        validate_min_length :password_hash, 60
        validate_max_length :password_hash, 60

    end
end
