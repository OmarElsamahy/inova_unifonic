# frozen_string_literal: true

require 'httparty'

require_relative 'unifonic_integration/version'
require_relative 'unifonic_integration/client'
require_relative 'unifonic_integration/configuration'

module UnifonicIntegration
  class Error < StandardError; end
end
