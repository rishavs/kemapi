module Kemapi
    class Post < Granite::Base
        adapter pg

        field title :     String
        field content :   String
        field link :      String
        
        timestamps
    end
end
