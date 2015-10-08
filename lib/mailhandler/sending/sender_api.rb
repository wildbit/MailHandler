require 'mail'
require 'postmark'
require_relative 'sender.rb'

module MailHandler

  module Sending

    class PostmarkAPISender < Sender

      attr_accessor :host,
                    :api_token,
                    :use_ssl

      def initialize(api_token = nil)

        @type = :postmark_api
        @host = DEFAULT_HOST
        @api_token = api_token
        @use_ssl = false

      end

      def send(email)

        client = setup_sending_client
        client.deliver_message(email)

      end

      protected

      DEFAULT_HOST = 'api.postmarkapp.com'

      def setup_sending_client

        # clearing cache so valid host is accepted, and not the cached one
        Postmark::HttpClient.instance_variable_set('@http', nil)
        Postmark::ApiClient.new(api_token, http_open_timeout: 15, host: host, secure: @use_ssl)

      end

    end

  end

end
