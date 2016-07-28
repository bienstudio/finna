require 'hanami/model'
require 'hanami/mailer'

Dir["#{ __dir__ }/finna/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  adapter type: :sql, uri: ENV['DATABASE_URL']

  migrations 'db/migrations'
  schema     'db/schema.sql'

  mapping do
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/finna/mailers"

  delivery do
    development :test
    test        :test
  end
end.load!
