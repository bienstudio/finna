require 'hanami/model'
require 'hanami/mailer'

Dir["#{ __dir__ }/finna/**/*.rb"].each { |file| require_relative file }

Hanami::Model.configure do
  adapter type: :sql, uri: ENV['DATABASE_URL']

  migrations 'db/migrations'
  schema     'db/schema.sql'

  mapping do
    collection :users do
      entity      User
      repository  UserRepository

      attribute :id,    Integer
      attribute :name,  String
      attribute :email, String
    end

    collection :friendships do
      entity      Friendship
      repository  FriendshipRepository

      attribute :id,        Integer
      attribute :user_id,   Integer
      attribute :friend_id, Integer
    end
  end
end.load!

Hanami::Mailer.configure do
  root "#{ __dir__ }/finna/mailers"

  delivery do
    development :test
    test        :test
  end
end.load!
