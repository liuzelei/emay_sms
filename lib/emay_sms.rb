require "emay_sms/version"
require "emay_sms/configuration"
require "savon"
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

    def client
      @client ||= Savon.client(wsdl: EmaySms.config.server, 
                                log: true,
                          log_level: :debug,
                   pretty_print_xml: true)
    end

    def sign_message(message, sign = nil)
      if sign.nil?
        "#{EmaySms.config.sign}#{message}"
      else
        "【#{sign}】#{message}"
      end
    end

    def active
      response = client.call(:regist_ex, message: { arg0: EmaySms.config.account, 
                                                    arg1: EmaySms.config.secret, 
                                                    arg2: EmaySms.config.password })
      if response.body[:regist_ex_response].nil? || response.body[:regist_ex_response][:return] != "0"
        return false
      else
        return true
      end
    end

    def register(hash = {})
      response = client.call(:regist_detail_info, message: { arg0: EmaySms.config.account, 
                                                             arg1: EmaySms.config.secret, 
                                                             arg2: hash[:name],
                                                             arg3: hash[:contact],
                                                             arg4: hash[:phone_number],
                                                             arg5: hash[:mobile],
                                                             arg6: hash[:email],
                                                             arg7: hash[:fax],
                                                             arg8: hash[:address],
                                                             arg9: hash[:post_code]})
      if response.body[:regist_detail_info_response].nil? || response.body[:regist_detail_info_response][:return] != "0"
        return false
      else
        return true
      end
    end

    def send(message, mobiles = [], sign = nil)
      response = client.call(:send_sms, message: { arg0: EmaySms.config.account,
                                                   arg1: EmaySms.config.secret,
                                                   arg2: "",
                                                   arg3: mobiles,
                                                   arg4: EmaySms.sign_message(message, sign),
                                                   arg5: "",
                                                   arg6: "UTF-8",
                                                   arg7: 1,
                                                   arg8: 0 })
      if response.body[:send_sms_response].nil? || response.body[:send_sms_response][:return] != "0"
        return false
      else
        return true
      end
    end
  end
end
