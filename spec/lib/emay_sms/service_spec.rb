require "spec_helper"

describe "Service" do
  it "should register new key" do
    service = EmaySms::Service.new
    p service.register
    expect(EmaySms.config.secrect).not_to be_nil
  end
end