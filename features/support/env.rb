require File.join File.dirname(__FILE__), '..', '..', 'lib', 'cuke_bank'

require 'capybara/cucumber'
Capybara.app = Sinatra::Application
Sinatra::Application.set :environment, :test
