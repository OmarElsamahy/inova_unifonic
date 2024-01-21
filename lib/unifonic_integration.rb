# frozen_string_literal: true

require 'httparty'

require_relative 'unifonic_integration/version'
require_relative 'unifonic_integration/client'
require_relative 'unifonic_integration/configuration'

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
