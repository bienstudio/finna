require_relative '../../../../apps/api/controllers/users/destroy'

RSpec.describe Api::Controllers::Users::Destroy do
  let(:action) { described_class.new }
  let(:user)   { UserRepository.create(build(:user)) }
  let(:params) do
    {
      id: user.id
    }
  end

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end

  it 'destroys a user' do
    response = action.call(params)

    expect(action.exposures[:user]).to eq user
    expect(UserRepository.find(user.id)).to be_nil
  end

  context 'params' do
    it 'returns 400 for invalid params' do
      response = action.call({})

      expect(response[0]).to eq 400
    end

    it 'rejects without an id' do
      response = action.call({})

      expect(action.params.errors[:id]).to eq ['is missing']
    end
  end
end
