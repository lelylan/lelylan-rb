require "helper"

describe Lelylan::Client::Statuses do

  let(:client) do
    a_client
  end


  describe ".statuses" do

    let(:path) do
      "/statuses"
    end

    before do
      stub_get("/statuses").to_return(body: fixture("statuses.json"))
    end

    let!(:statuses) do
      client.statuses
    end

    it "returns a list of statuses" do
      statuses.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("status.json"))
      end

      before do
        client.statuses(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".status" do

    let(:path) do
      "/statuses/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("status.json"))
    end

    let!(:status) do
      client.status(uri)
    end

    it "returns the status" do
      status.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".create_status" do

    let(:path) do
      "/statuses"
    end

    before do
      stub_post(path).with(body: {name: "Setting intensity"}).to_return(body: fixture("status.json"))
    end

    let!(:status) do
      client.create_status(name: "Setting intensity")
    end

    it "returns the status" do
      status.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Setting intensity"}).should have_been_made
    end
  end


  describe ".update_status" do

    let(:path) do
      "/statuses/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Setting intensity"}).to_return(body: fixture("status.json"))
    end

    let!(:status) do
      client.update_status(uri, name: "Setting intensity")
    end

    it "returns the status" do
      status.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Setting intensity"}).should have_been_made
    end
  end


  describe ".delete_status" do

    let(:path) do
      "/statuses/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("status.json"))
    end

    let!(:status) do
      client.delete_status(uri)
    end

    it "returns the status" do
      status.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end
end
