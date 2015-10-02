# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mailhandler/version'

Gem::Specification.new do |s|

  s.name        = 'mailhandler'
  s.version     = MailHandler::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'

  s.authors     = ["Igor Balos"]
  s.email       = "ibalosh@gmail.com"

  s.summary     = "Postmark email receiving and sending handler."
  s.description = "Use this gem to send emails through SMTP and Postmark API. Check if email arrived by imap or folder check."


  s.files       = `git ls-files`.split($/)
  s.homepage    = 'https://github.com/ibalosh'
  s.require_paths = ["lib"]

  s.add_dependency "mail"
  s.add_dependency "postmark"

end