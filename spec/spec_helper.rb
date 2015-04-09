require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'emay_sms'

Bundler.setup

EmaySms.setup do |config|
  config.server   = "http://sdk4report.eucp.b2m.cn:8080/sdk/SDKService?wsdl"
  config.account  = "6SDK-EMY-6688-KIUQS"
  config.password = "887958"
  config.secret   = "JztJpw4013"
  #config.sign     = "就诊通"
end

RSpec.configure do |config|
  config.before(:each) do
  end
end