require 'bundler/setup'

require 'tilt'
require 'rabl/template'

require 'hanami/setup'
require_relative '../lib/finna'
require_relative '../apps/api/application'
require_relative '../apps/web/application'

Hanami::Container.configure do
  mount Api::Application, at: '/api'
  mount Web::Application, at: '/'
end
