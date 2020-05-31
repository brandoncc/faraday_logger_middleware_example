# frozen_string_literal: true

module FaradayMiddleware
  class LogRequests < Faraday::Middleware
    def initialize(app, logger)
      super(app)

      @app = app
      @logger = logger
    end

    def call(env)
      # any processing you want including altering the environment
      # (see https://lostisland.github.io/faraday/middleware/custom)
      @logger.info("Using method #{env.method} to access #{env.url}")

      # You must do this when you are done with your processing
      @app.call(env)
    end
  end
end
