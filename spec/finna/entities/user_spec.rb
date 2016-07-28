RSpec.describe User do
  let(:user) { build(:user) }

  describe '#first_name' do
    it 'returns the first word in the name' do
      expect(user.first_name).to eql 'Bill'
    end
  end
end
