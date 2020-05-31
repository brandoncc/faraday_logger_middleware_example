# frozen_string_literal: true

# we need faraday
require 'faraday'

# we need our logger
require_relative 'lib/my_logger'

# we need our middleware
require_relative 'lib/faraday_middleware/log_requests'

# create an instance of our logger to pass into our middleware
logger = MyLogger.new

# create a new Faraday connection interface
connection = Faraday.new(url: 'https://brandoncc.dev') do |conn|
  # use our middleware
  conn.request :log_requests, logger
end

connection.get('/')
