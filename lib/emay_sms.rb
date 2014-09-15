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

    def sign_message(message)
      "#{EmaySms.config.sign}#{message}"
    end

    def register
      # @client.call(:regist_ex, message: { softwareSerialNo: EmaySms.config.account, 
      #                                                  key: EmaySms.config.secrect, 
      #                                           serialpass: EmaySms.config.password })
      response = client.call(:regist_ex, message: { arg0: EmaySms.config.account, 
                                                    arg1: EmaySms.config.secrect, 
                                                    arg2: EmaySms.config.password })
      if response.body[:regist_ex_response].nil? || response.body[:regist_ex_response][:return] != "0"
        return false
      else
        return true
      end
    end

    def send(message, mobiles = [])
      # response = @client.call(:send_sms, message: { softwareSerialNo: EmaySms.config.account,
      #                                                            key: EmaySms.config.secrect,
      #                                                       sendTime: "",
      #                                                        mobiles: mobiles,
      #                                                     smsContent: message,
      #                                                      addSerial: "",
      #                                                     srcCharset: "UTF-8",
      #                                                    smsPriority: 1,
      #                                                          smsID: 0 })
      response = client.call(:send_sms, message: { arg0: EmaySms.config.account,
                                                   arg1: EmaySms.config.secrect,
                                                   arg2: "",
                                                   arg3: mobiles,
                                                   arg4: EmaySms.sign_message(message),
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
