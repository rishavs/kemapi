require "kemal"
# require "sentry-run"
require "dotenv"
require "pg"
require "granite/adapter/pg"
require "crypto/bcrypt/password"
require "uuid"
require "jwt"

puts "Setting up the app ..."

Dotenv.load!

puts "Initializing Database"

require "./errors.cr"
require "./models.cr"
require "./actions/*"

require "./routes.cr"
require "./handlers.cr"

module Kemapi

    # User.migrator.drop_and_create
    # Post.migrator.drop_and_create
    begin
        Kemal.run
    rescue ex
        pp " Yo dis be main exception"
        pp ex.message
    end
end
