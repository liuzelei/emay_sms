require "spec_helper"

describe "Service" do
  it "should register new key" do
    service = EmaySms.register
    expect(EmaySms.config.secrect).not_to be_nil
  end

  it "should send message" do
    response = EmaySms.send("测试 #{Time.now.to_i}", "18101801755")
    expect(response).not_to be false
  end
end