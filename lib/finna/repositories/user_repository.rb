# The database repository for User entities.
class UserRepository
  include Hanami::Repository

  # Returns the first user for a given email.
  #
  # @param [String] email The email address to query.
  # @return [User] The first user found.
  def self.find_by_email(email)
    query { where(email: email) }.first
  end
end
