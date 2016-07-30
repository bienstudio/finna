require_relative '../../../../apps/api/controllers/users/create'

RSpec.describe Api::Controllers::Users::Create do
  let(:action) { described_class.new }
  let(:params) do
    {
      user: {
        email: generate(:email),
        name: 'Bill Nye'
      }
    }
  end

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end

  it 'creates a new user' do
    response = action.call(params)

    expect(action.exposures[:user]).to be_a User
    expect(action.exposures[:user].email).to eq params[:user]['email']
  end

  context 'params' do
    it 'returns 400 for invalid params' do
      response = action.call({})

      expect(response[0]).to eq 400
    end

    it 'rejects without a user hash' do
      response = action.call({})

      expect(action.params.errors[:user]).to eq ['is missing']
    end

    it 'rejects without an email' do
      response = action.call({ user: { name: 'Foobar' } })

      expect(action.params.errors[:user][:email]).to include 'is missing'
    end

    it 'rejects with an improperly formatted email' do
      response = action.call({ user: { email: 'foo' }})

      expect(action.params.errors[:user][:email]).to eq ['is in invalid format']
    end

    it 'rejects without a name' do
      response = action.call({ user: { email: 'foo@bar.com' } })

      expect(action.params.errors[:user][:name]).to eq ['is missing']
    end
  end
end
