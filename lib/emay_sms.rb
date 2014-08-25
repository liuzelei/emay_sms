require "emay_sms/version"
require "emay_sms/configuration"
require "emay_sms/service"
require "logger"

module EmaySms
  class << self
    def setup
      yield config
    end

    def config
      @config ||= Configuration.new
    end

    def logger
      @logger ||= Logger.new(STDOUT)
    end
  end
end
