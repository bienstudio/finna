RSpec.describe Friendship do
  let!(:friendship) { build(:friendship) }

  describe '#user' do
    let(:_friendship) { FriendshipRepository.create(friendship) }

    it 'returns the correct user' do
      expect(_friendship.user).to eq UserRepository.find(friendship.user_id)
    end
  end

  describe '#user=' do
    let(:user) { UserRepository.create(build(:user)) }

    it 'sets the user_id' do
      friendship.user = user

      expect(friendship.user_id).to eq user.id
    end
  end

  describe '#friend' do
    let(:_friendship) { FriendshipRepository.create(friendship) }

    it 'returns the correct user' do
      expect(_friendship.friend).to eq UserRepository.find(friendship.friend_id)
    end
  end

  describe '#friend=' do
    let(:user) { UserRepository.create(build(:user)) }

    it 'sets the friend_id' do
      friendship.friend = user

      expect(friendship.friend_id).to eq user.id
    end
  end
end
