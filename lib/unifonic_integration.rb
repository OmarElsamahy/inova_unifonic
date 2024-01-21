# frozen_string_literal: true

require "httparty"

require_relative "unifonic_integration/version"
require_relative "unifonic_integration/client"
require_relative "unifonic_integration/configuration"

# The module is for integrating with Unifonic API to send scheduled and non-scheduled SMS.
module UnifonicIntegration
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
