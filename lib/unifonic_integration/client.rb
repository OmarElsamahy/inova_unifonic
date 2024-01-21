# frozen_string_literal: true

require "httparty"

module UnifonicIntegration
  # The `Client` class provides a interface for interacting with the Unifonic API.
  # It includes methods for sending messages, validating recipients, etc.
  class Client
    include HTTParty
    base_uri "https://el.cloud.unifonic.com/rest/SMS"

    attr_accessor :config

    def initialize
      @config = UnifonicIntegration.configuration
      validate_configuration
    end

    def send_message(body, recipient)
      validate_recipient(recipient)
      endpoint = "/messages?async=false"
      set_headers
      set_message_params(body, recipient)
      response = self.class.post(endpoint, headers: @headers, body: @params)
      puts response.body
    end

    def validate_recipient(recipient)
      raise ArgumentError, "Phone number should not start with + or 00." if recipient.to_s.start_with?("+", "00")
    end

    def send_scheduled_message(body, recipient, time_scheduled)
      validate_recipient(recipient)
      endpoint = "/messages/scheduledmessages?async=false"
      set_headers
      set_scheduled_message_params(body, recipient, time_scheduled)
      response = self.class.post(endpoint, headers: @headers, body: @params)
      puts response.body
    end

    def set_headers
      @headers = {
        Accept: "application/json"
      }
    end

    def set_scheduled_message_params(body, recipient, time_scheduled)
      set_message_params(body, recipient)
      @params.merge!(TimeScheduled: time_scheduled)
    end

    def set_message_params(body, recipient)
      @params = {
        AppSid: @config.app_sid,
        SenderID: @config.sender_id,
        Body: body,
        Recipient: recipient
      }
    end

    def validate_configuration
      return if @config.app_sid && @config.sender_id

      raise ConfigurationError, "UnifonicIntegration gem not properly configured. Please set app_sid and sender_id."
    end
  end

  class ConfigurationError < StandardError; end
end
