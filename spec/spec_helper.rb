require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'emay_sms'

Bundler.setup

EmaySms.setup do |config|
  config.server   = "http://sdk4report.eucp.b2m.cn:8080/sdk/SDKService?wsdl"
  config.account  = "0SDK-EAA-6688-JETNS"
  config.password = "123123"
  config.secrect  = "123123"
end

RSpec.configure do |config|
  config.before(:each) do
  end
end