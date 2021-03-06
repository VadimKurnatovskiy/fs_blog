# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'factory_bot_rails'
require 'support/database_cleaner'
require 'support/devise_support'
require 'devise'

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.expose_dsl_globally = false
  config.use_transactional_fixtures = true
  #config.autoload_paths += %W(#{config.root}/lib)

  config.infer_spec_type_from_file_location!

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :view
end
