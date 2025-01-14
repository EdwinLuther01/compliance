# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'support/factory_bot'
require 'spec_helper'
require 'capybara/rspec'
require 'aasm/rspec'
require 'strip_attributes/matchers'
ENV['RAILS_ENV'] ||= 'test'
ENV["TZ"] = "UTC"
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'support/webdrivers'
require 'rspec/rails'
require 'support/wait_for_ajax'
Dir[Rails.root.join("spec/helpers/**/*.rb")].each {|f| require f} 

FactoryBot.definition_file_paths = [ Rails.root.join('spec', 'factories') ]
FactoryBot.find_definitions

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  config.include RSpec::Rails::RequestExampleGroup, type: :feature

  Capybara.register_driver :firefox do |app|
    browser_options = ::Selenium::WebDriver::Firefox::Options.new()
    browser_options.args << '--headless' if ENV['SELENIUM_HEADLESS']
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['intl.accept_languages'] = "es"
    browser_options.profile = profile
    browser_options.profile['browser.download.dir'] = DownloadHelpers::PATH.to_s
    browser_options.profile['browser.download.folderList'] = 2
    browser_options.profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/csv; application/zip'

    Capybara::Selenium::Driver.new(app, browser: :firefox, options: browser_options)
  end

  Capybara.configure do |config|
    #config.run_server = false
    config.default_driver = :firefox
  end
  Capybara.default_max_wait_time = 5 

  config.include StripAttributes::Matchers

  config.before(:suite) do
    unless ENV['IN_CIRCLE']
      DockerHelpers.ensure_elastic_mq_test_is_running
    end
    DatabaseCleaner.clean_with(:truncation)
    Redis::Objects.redis.flushdb
    EventLog.purge_sqs_queue
  end

  config.before(:each) do
    AdminUser.current_admin_user = nil
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    DownloadHelpers::clear_downloads
  end
  
  config.after(:each) do
    Timecop.return
    DatabaseCleaner.clean
    Redis::Objects.redis.flushdb
    EventLog.purge_sqs_queue
  end
end
