# The database repository for Friendship entities.
class FriendshipRepository
  include Hanami::Repository

  # Returns all of the friendships of a user, regardless of whether they are the
  # user or friend.
  #
  # @param [User] user The user to get the friends of.
  # @return [Array<Friendship>] All of the friendships.
  def self.all_for_user(user)
    query { where(user_id: user.id).or(friend_id: user.id) }.all
  end
end
