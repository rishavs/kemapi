require "kemal"

require "./kemapi/*"

# TODO: Write documentation for `Kemapi`
module Kemapi
  # TODO: Put your code here
    get "/" do
        "Hello World!"
    end
  
    Kemal.run
end
