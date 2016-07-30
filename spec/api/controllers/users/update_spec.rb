require_relative '../../../../apps/api/controllers/users/update'

RSpec.describe Api::Controllers::Users::Update do
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

  it "updates a user's name" do
    response = action.call(params.merge(user: { name: 'Carl Sagan' }))

    expect(action.exposures[:user]).to be_a User
    expect(action.exposures[:user].name).to eq 'Carl Sagan'
    expect(UserRepository.find(user.id).name).to eq 'Carl Sagan'
  end

  it "updates a user's email" do
    email = generate(:email)
    response = action.call(params.merge(user: { email: email }))

    expect(action.exposures[:user]).to be_a User
    expect(action.exposures[:user].email).to eq email
    expect(UserRepository.find(user.id).email).to eq email
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
