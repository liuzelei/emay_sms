require "spec_helper"

describe "Service" do
  it "should active new key" do
    response = EmaySms.active
    expect(response).to be true
  end

  it "should register info" do
    data = { name: '一个神奇的网站', contact: '大理石', phone_number: '021-12345678', mobile: '13800138000', email: 'test@test.com', fax: '021-12345678', address: '天朝', post_code: '200100' }
    response = EmaySms.register(data)
    expect(response).to be true
  end

  it "should send message" do
    response = EmaySms.send("订单 #{Time.now.to_i} 已经团购成功, 请访问 http://www.baidu.com 支付.", ["13817513107", "18101801755", "18616015606"])
    expect(response).to be true
  end

  it "should send message by custom sign" do
    response = EmaySms.send("订单 #{Time.now.to_i} 已经团购成功, 请访问 http://www.baidu.com 支付.", ["13681695220"], "中国移动")
    expect(response).to be true
  end
end