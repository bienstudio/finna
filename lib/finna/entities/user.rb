# A User is a single person.
class User
  include Hanami::Entity

  attributes :name, :email

  # Returns the first word of the person's name (i.e., their first name).
  #
  # @return [String] Their first name.
  def first_name
    name.split(' ').first
  end
end
