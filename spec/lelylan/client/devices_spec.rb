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
      stub_post(path).with(name: "Dimmer").to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.create_device(name: "Dimmer")
    end

    it "returns the device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with({name: "Dimmer"}).should have_been_made
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
      stub_put(path).with(name: "Dimmer").to_return(body: fixture("device.json"))
    end

    let!(:device) do
      client.update_device(uri, name: "Dimmer")
    end

    it "returns the device" do
      device.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with({name: "Dimmer"}).should have_been_made
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
end
