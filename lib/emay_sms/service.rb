require "savon"

module EmaySms
  class Service
    def initialize
      @client = Savon.client(wsdl: EmaySms.config.server)
    end

    def client
      @client
    end

    def register
      @client.call(:regist_ex, message: { softwareSerialNo: EmaySms.config.account, 
                                                      key: EmaySms.config.secrect, 
                                               serialpass: EmaySms.config.password })
    end

    def send(message, mobiles = [])
      p EmaySms.config
      @client.call(:send_sms, message: { softwareSerialNo: EmaySms.config.account,
                                                     key: EmaySms.config.secrect,
                                                sendTime: nil,
                                                 mobiles: mobiles,
                                              smsContent: message,
                                               addSerial: nil,
                                              srcCharset: "UTF-8",
                                             smsPriority: 1,
                                                   smsID: 0 })
    end
  end
end