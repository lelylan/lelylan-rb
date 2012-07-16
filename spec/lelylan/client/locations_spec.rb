require "helper"

describe Lelylan::Client::Locations do

  let(:client) do
    a_client
  end


  describe ".location" do

    let(:path) do
      "/locations/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("location.json"))
    end

    let!(:location) do
      client.location(uri)
    end

    it "returns the location" do
      location.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".locations" do

    let(:path) do
      "/locations"
    end

    before do
      stub_get("/locations").to_return(body: fixture("locations.json"))
    end

    let!(:locations) do
      client.locations
    end

    it "returns a list of locations" do
      locations.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("location.json"))
      end

      before do
        client.locations(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".create_location" do

    let(:path) do
      "/locations"
    end

    before do
      stub_post(path).with(body: {name: "Dimmer"}).to_return(body: fixture("location.json"))
    end

    let!(:location) do
      client.create_location(name: "Dimmer")
    end

    it "returns the location" do
      location.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".update_location" do

    let(:path) do
      "/locations/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Dimmer"}).to_return(body: fixture("location.json"))
    end

    let!(:location) do
      client.update_location(uri, name: "Dimmer")
    end

    it "returns the location" do
      location.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".delete_location" do

    let(:path) do
      "/locations/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("location.json"))
    end

    let!(:location) do
      client.delete_location(uri)
    end

    it "returns the location" do
      location.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end
end
