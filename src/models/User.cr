module Kemapi
    class User < Granite::Base
        adapter pg

        field username :      String
        field password_hash : String
        
        timestamps
    end
end
