require "spec_helper"

describe "Service" do
  it "should register new key" do
    service = EmaySms::Service.new
    service.register
    expect(EmaySms.config.secrect).not_to be_nil
  end

  it "should send message" do
    service = EmaySms::Service.new
    response = service.send("【救诊通】测试 #{Time.now.to_i}", "18101801755")
    expect(response).not_to be false
  end
end