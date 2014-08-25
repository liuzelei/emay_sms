require "spec_helper"

describe "Service" do
  it "should register new key" do
    service = EmaySms::Service.new
    p service.register
    expect(EmaySms.config.secrect).not_to be_nil
  end

  it "should send message" do
    service = EmaySms::Service.new
    p service.send("发送验证码896821","18616015606")
    expect("s").not_to be_nil
  end
end