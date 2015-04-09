module EmaySms
  class Configuration
    def server
      @server ||= "http://sdk4report.eucp.b2m.cn:8080/sdk/SDKService?wsdl"
    end

    def server=(server)
      @server = server
    end

    def account
      @account ||= "account"
    end

    def account=(account)
      @account = account
    end

    def password
      @password ||= "password"
    end

    def password=(password)
      @password = password
    end

    def secret
      @secret ||= SecureRandom.hex(10)
    end

    def secret=(secret)
      @secret = secret
    end

    def sign
      @sign
    end

    def sign=(sign)
      @sign = "【#{sign}】"
    end
  end
end