require_relative '../../../../apps/api/controllers/users/show'

RSpec.describe Api::Controllers::Users::Show do
  let(:user)   { UserRepository.create(build(:user)) }
  let(:action) { described_class.new }
  let(:params) { Hash[id: user.id] }

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end

  it 'exposes the correct user' do
    response = action.call(params)

    expect(action.exposures[:user]).to eq user
  end

  it 'returns 404 if the user was not found' do
    response = action.call(Hash[id: 123123123123])

    expect(response[0]).to eq 404
  end
end
