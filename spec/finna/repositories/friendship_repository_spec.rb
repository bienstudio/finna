RSpec.describe FriendshipRepository do
  let(:friendship) { FriendshipRepository.create(build(:friendship)) }

  describe '.all_for_user' do
    it 'returns all friendships for a given user' do
      query = FriendshipRepository.all_for_user(friendship.user)

      expect(query).to include friendship
    end

    it 'returns all friendships for a given friend' do
      query = FriendshipRepository.all_for_user(friendship.friend)

      expect(query).to include friendship
    end
  end
end
