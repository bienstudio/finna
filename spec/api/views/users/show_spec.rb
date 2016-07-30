require_relative '../../../../apps/api/views/users/show'

RSpec.describe Api::Views::Users::Show do
  let(:exposures) { Hash[user: UserRepository.create(build(:user))] }
  let(:template)  { Hanami::View::Template.new('apps/api/templates/user.rabl') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #user' do
    expect(view.user).to eq exposures.fetch(:user)
  end

  it 'renders JSON' do
    json = {
      user: {
        id: exposures.fetch(:user).id,
        name: exposures.fetch(:user).name,
        email: exposures.fetch(:user).email
      }
    }.to_json

    expect(rendered).to eq json
  end
end
