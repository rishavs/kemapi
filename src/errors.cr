module Kemapi::Errors
    class Content
        def self.badrequest ()
            {"status"   => "error",
            "message"   => "ERROR => 400 Bad Request",
            "hints"     => "Check the input data format"}
        end
        def self.unauthenticated ()
            {"status"   => "error", 
            "message"   => "ERROR => 401 Unauthorized Request." ,
            "hints"     => "You need to be authenticated to use this resource"}
        end
        def self.forbidden ()
            { "status"  => "error",
            "message"   => "ERROR => 403 Forbidden." ,
            "hints"     => "You may not be authorized to access a this resource"}
        end
        def self.unprocessable ()
            { "status"  => "error",
            "message"   => "ERROR => 422 Unprocessable Entity",
            "hints"     => "Check the input data for invalid entries" }
        end
        def self.unknown ()
            { "status"  => "error", 
            "message"   => "ERROR: 500 Internal Server Error",
            "details"   => "This exception is not yet explicitly handled. Reach out to the dev." }
        end

    end
end
    