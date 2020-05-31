# frozen_string_literal: true

require 'faraday'

module FaradayMiddleware
  # load the middleware from the relative directory ./request
  autoload :LogRequests, "#{File.dirname(__FILE__)}/request/log_requests.rb"

  # register the middleware under the key :log_requests, for later use
  Faraday::Request.register_middleware log_requests: -> { LogRequests }
end
