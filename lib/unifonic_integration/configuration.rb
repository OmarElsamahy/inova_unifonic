# frozen_string_literal: true

module UnifonicIntegration
  # The `Configuration` class provides an interface for setting up credentials for the Unifonic API.
  class Configuration
    attr_accessor :app_sid, :sender_id

    def initialize
      @app_sid = nil
      @sender_id = nil
    end
  end
end
