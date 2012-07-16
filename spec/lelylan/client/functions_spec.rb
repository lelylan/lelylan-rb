require "helper"

describe Lelylan::Client::Functions do

  let(:client) do
    a_client
  end


  describe ".functions" do

    let(:path) do
      "/functions"
    end

    before do
      stub_get("/functions").to_return(body: fixture("functions.json"))
    end

    let!(:functions) do
      client.functions
    end

    it "returns a list of functions" do
      functions.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("function.json"))
      end

      before do
        client.functions(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".function" do

    let(:path) do
      "/functions/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("function.json"))
    end

    let!(:function) do
      client.function(uri)
    end

    it "returns the function" do
      function.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".create_function" do

    let(:path) do
      "/functions"
    end

    before do
      stub_post(path).with(body: {name: "Set intensity"}).to_return(body: fixture("function.json"))
    end

    let!(:function) do
      client.create_function(name: "Set intensity")
    end

    it "returns the function" do
      function.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Set intensity"}).should have_been_made
    end
  end


  describe ".update_function" do

    let(:path) do
      "/functions/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Set intensity"}).to_return(body: fixture("function.json"))
    end

    let!(:function) do
      client.update_function(uri, name: "Set intensity")
    end

    it "returns the function" do
      function.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Set intensity"}).should have_been_made
    end
  end


  describe ".delete_function" do

    let(:path) do
      "/functions/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("function.json"))
    end

    let!(:function) do
      client.delete_function(uri)
    end

    it "returns the function" do
      function.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end
end
