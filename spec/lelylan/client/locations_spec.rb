require "helper"

describe Lelylan::Client::Consumptions do

  let(:client) do
    a_client
  end


  describe ".consumption" do

    let(:path) do
      "/consumptions/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("consumption.json"))
    end

    let!(:consumption) do
      client.consumption(uri)
    end

    it "returns the consumption" do
      consumption.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".consumptions" do

    let(:path) do
      "/consumptions"
    end

    before do
      stub_get("/consumptions").to_return(body: fixture("consumptions.json"))
    end

    let!(:consumptions) do
      client.consumptions
    end

    it "returns a list of consumptions" do
      consumptions.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("consumption.json"))
      end

      before do
        client.consumptions(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".create_consumption" do

    let(:path) do
      "/consumptions"
    end

    before do
      stub_post(path).with(body: {name: "Dimmer"}).to_return(body: fixture("consumption.json"))
    end

    let!(:consumption) do
      client.create_consumption(name: "Dimmer")
    end

    it "returns the consumption" do
      consumption.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".update_consumption" do

    let(:path) do
      "/consumptions/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Dimmer"}).to_return(body: fixture("consumption.json"))
    end

    let!(:consumption) do
      client.update_consumption(uri, name: "Dimmer")
    end

    it "returns the consumption" do
      consumption.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".delete_consumption" do

    let(:path) do
      "/consumptions/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("consumption.json"))
    end

    let!(:consumption) do
      client.delete_consumption(uri)
    end

    it "returns the consumption" do
      consumption.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end
end
