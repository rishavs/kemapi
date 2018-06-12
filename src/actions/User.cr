module Kemapi
    class User < DefaultHandler
#       take schema name and the request object as input parameters
        def initialize(@name)
            # @name = "John"
        end

        def validate_header()
        end

        def validate_body()
        end

        def create ()
        end

        def update ()

        end

        def replace ()
        end

        def delete()
        end
    end
end