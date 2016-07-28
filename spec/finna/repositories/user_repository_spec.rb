RSpec.describe UserRepository do
  let(:user) { UserRepository.create(build(:user)) }

  describe '.find_by_email' do
    it 'returns the first match of a given email' do
      query = UserRepository.find_by_email(user.email)

      expect(query).to eq user
    end
  end

  after(:all) do
    UserRepository.clear
  end
end
