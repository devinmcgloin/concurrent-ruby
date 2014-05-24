require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  project_name 'concurrent-ruby'
  add_filter '/coverage/'
  add_filter '/doc/'
  add_filter '/pkg/'
  add_filter '/spec/'
  add_filter '/tasks/'
end

require 'concurrent'

logger                          = Logger.new($stderr)
logger.level                    = Logger::INFO
Concurrent.configuration.logger = -> (level, progname, message = nil, &block) { logger.add level, message, progname, &block }

# import all the support files
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require File.expand_path(f) }

RSpec.configure do |config|
  config.order = 'random'
end
