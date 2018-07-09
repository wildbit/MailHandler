
require 'net/imap'
require_relative 'base'

module MailHandler
  module Sending
    # class which describes methods to send and receive emails
    class SMTPSender < Sender
      attr_accessor :address,
                    :port,
                    :domain,
                    :username,
                    :password,
                    :authentication,
                    :use_ssl

      attr_accessor :open_timeout,
                    :read_timeout,
                    :save_response

      def initialize
        @type = :smtp
        @authentication = 'plain'
        @use_ssl = false
        @save_response = false

        @open_timeout = 60
        @read_timeout = 60
      end

      def send(email)
        verify_email(email)
        email = configure_sending(email)
        save_response ? email.deliver! : email.deliver
      end

      private

      def configure_sending(email)
        options = {
          address: address,
          port: port,
          domain: domain,
          user_name: username,
          password: password,
          authentication: @authentication,
          enable_starttls_auto: @use_ssl,

          return_response: save_response,
          open_timeout: open_timeout,
          read_timeout: read_timeout
        }

        email.delivery_method :smtp, options
        email
      end
    end
  end
end
