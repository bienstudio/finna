# A Friendship is a connection between two people. The +user+ will end up being
# the person who instigated the friendship, and the +friend+ is the person
# recieving the request.
class Friendship
  include Hanami::Entity

  attributes :user_id, :friend_id

  # Returns the +User+ for the +user_id+.
  #
  # @return [User] A user.
  def user
    UserRepository.find(user_id)
  end

  # Sets +user_id+ from a +User+.
  #
  # @param [User] _user The user to set as the user.
  # @return [User] The same user back.
  def user=(_user)
    self.user_id = _user.id

    _user
  end

  # Returns the +User+ for the +friend_id+.
  #
  # @return [User] A user.
  def friend
    UserRepository.find(friend_id)
  end

  # Sets +friend_id+ from a +User+.
  #
  # @param [User] _user The user to set as the user.
  # @return [User] The same user back.
  def friend=(_user)
    self.friend_id = _user.id

    _user
  end
end
