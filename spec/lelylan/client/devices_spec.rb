require "helper"

describe Lelylan::Client::Devices do

  let(:client) do
    a_client
  end


  describe ".devices" do

    let(:path) do
      "/devices"
    end

    before do
      stub_get("/devices").to_return(body: fixture("devices.json"))
    end

    let!(:devices) do
      client.devices
    end

    it "returns a list of devices" do
      devices.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("device.json"))
      end

      before do
        client.devices(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".device" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.device(uri)
    end

    it "returns the device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".create_device" do

    let(:path) do
      "/devices"
    end

    before do
      stub_post(path).with(body: {name: "Dimmer"}).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.create_device(name: "Dimmer")
    end

    it "returns the device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".update_device" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Dimmer"}).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.update_device(uri, name: "Dimmer")
    end

    it "returns the device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".delete_device" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.delete_device(uri)
    end

    it "returns the device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end


  describe ".execute" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:function) do
      "http://api.lelylan.com/functions/4dcb9e23d033a9088900020a"
    end

    let(:properties) do
      [{uri: "http://api.lelylan.com/properties/4dcb9e23d033a9088900020a", value: "50"}]
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put("#{path}/functions").with(query: {uri: function}).with(body: {properties: properties}).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.execute(uri, function, properties: properties)
    end

    it "returns the updated device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_put("#{path}/functions").with(query: {uri: function}).with(body: {properties: properties}).should have_been_made
    end
  end


  describe ".update_properties" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:properties) do
      [{uri: "http://api.lelylan.com/properties/4dcb9e23d033a9088900020a", value: "50"}]
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put("#{path}/properties").with(body: {properties: properties}).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.update_properties(uri, properties: properties)
    end

    it "returns the updated device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_put("#{path}/properties").with(body: {properties: properties}).should have_been_made
    end
  end


  describe ".connect_physical" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:physical) do
      "http://api.lelylan.com/properties/4dcb9e23d033a9088900020a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put("#{path}/physical").with(body: {uri: physical}).to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.connect_physical(uri, uri: physical)
    end

    it "returns the updated device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_put("#{path}/physical").with(body: {uri: physical}).should have_been_made
    end
  end


  describe ".disconnect_physical" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete("#{path}/physical").to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.disconnect_physical(uri)
    end

    it "returns the updated device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete("#{path}/physical").should have_been_made
    end
  end


  describe ".pending" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get("#{path}/pending").to_return(body: fixture("pending.json"))
    end

    let!(:device) do
      client.pending(uri)
    end

    it "returns the pending resource" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_get("#{path}/pending").should have_been_made
    end
  end


  describe ".update_pending" do

    let(:path) do
      "/devices/4dcb9e23d033a9088900000a"
    end

    let(:properties) do
      [{uri: "http://api.lelylan.com/properties/4dcb9e23d033a9088900020a", value: "50"}]
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put("#{path}/pending").with(body: {properties: properties}).to_return(body: fixture("pending.json"))
    end

    let!(:device) do
      client.update_pending(uri, properties: properties)
    end

    it "returns the updated device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_put("#{path}/pending").with(body: {properties: properties}).should have_been_made
    end
  end
end
