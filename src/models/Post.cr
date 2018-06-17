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
end
