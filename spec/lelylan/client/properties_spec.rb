require "helper"

describe Lelylan::Client::Properties do

  let(:client) do
    a_client
  end


  describe ".properties" do

    let(:path) do
      "/properties"
    end

    before do
      stub_get("/properties").to_return(body: fixture("properties.json"))
    end

    let!(:properties) do
      client.properties
    end

    it "returns a list of properties" do
      properties.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("property.json"))
      end

      before do
        client.properties(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".property" do

    let(:path) do
      "/properties/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("property.json"))
    end

    let!(:property) do
      client.property(uri)
    end

    it "returns the property" do
      property.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".create_property" do

    let(:path) do
      "/properties"
    end

    before do
      stub_post(path).with(body: {name: "Status"}).to_return(body: fixture("property.json"))
    end

    let!(:property) do
      client.create_property(name: "Status")
    end

    it "returns the property" do
      property.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Status"}).should have_been_made
    end
  end


  describe ".update_property" do

    let(:path) do
      "/properties/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Status"}).to_return(body: fixture("property.json"))
    end

    let!(:property) do
      client.update_property(uri, name: "Status")
    end

    it "returns the property" do
      property.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Status"}).should have_been_made
    end
  end


  describe ".delete_property" do

    let(:path) do
      "/properties/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("property.json"))
    end

    let!(:property) do
      client.delete_property(uri)
    end

    it "returns the property" do
      property.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end
end
