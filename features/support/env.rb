require_relative "../../lib/cuke_bank"
require_relative "../../lib/sinatra_app"

require 'capybara/cucumber'

Capybara.app = Sinatra::Application
Sinatra::Application.set :environment, :test
