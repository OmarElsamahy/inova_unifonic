# frozen_string_literal: true

require 'httparty'

module UnifonicIntegration
  class Client
    include HTTParty
    base_uri 'https://el.cloud.unifonic.com/rest/SMS'

    attr_accessor :config

    def initialize
      @config = Configuration.new
    end

    def send_message(body, recipient)

      unless validate_recipient(recipient)
        puts "Invalid recipient phone number format. Please provide a valid international format."
        return
      end

      endpoint = '/messages?async=false'
      set_headers
      set_message_params(body, recipient)
      response = self.class.post(endpoint, headers: @headers, body: @params)
      puts response.body
    end

    def validate_recipient(recipient)
      cleaned_number = recipient.to_s.gsub(/^(\+|00)/, '')
      cleaned_number =~ /\A\d+\z/
    end

    def send_scheduled_message(body, recipient, time_scheduled)
      unless validate_recipient(recipient)
        puts "Invalid recipient phone number format. Please provide a valid international format."
        return
      end

      endpoint = '/messages/scheduledmessages?async=false'
      set_headers
      set_scheduled_message_params(body, recipient, time_scheduled)
      response = self.class.post(endpoint, headers: @headers, body: @params)
      puts response.body
    end

    def set_headers
      @headers = {
        Accept: 'application/json',
      }
    end

    def set_scheduled_message_params(body, recipient, time_scheduled)
      set_message_params(body, recipient)
      @params.merge!(TimeScheduled: time_scheduled)
    end

    def set_message_params()
      @params = {
        AppSid: @config.app_sid,
        SenderID: @config.sender_id,
        Body: body,
        Recipient: recipient
      }
    end

  end

  end
end
