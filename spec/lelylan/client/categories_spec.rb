require "helper"

describe Lelylan::Client::Categories do

  let(:client) do
    a_client
  end


  describe ".categories" do

    let(:path) do
      "/categories"
    end

    before do
      stub_get("/categories").to_return(body: fixture("categories.json"))
    end

    let!(:categories) do
      client.categories
    end

    it "returns a list of categories" do
      categories.should have(1).item
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end

    context "with params" do

      before do
        stub_get(path).with(query: {per: "25"}).to_return(body: fixture("category.json"))
      end

      before do
        client.categories(per: 25)
      end

      it "sends the params" do
        a_get(path).with(query: {per: "25"}).should have_been_made
      end
    end
  end


  describe ".category" do

    let(:path) do
      "/categories/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture("category.json"))
    end

    let!(:category) do
      client.category(uri)
    end

    it "returns the category" do
      category.uri.should_not be_nil
    end

    it "sends the request" do
      a_get(path).should have_been_made
    end
  end


  describe ".create_category" do

    let(:path) do
      "/categories"
    end

    before do
      stub_post(path).with(body: {name: "Dimmer"}).to_return(body: fixture("category.json"))
    end

    let!(:category) do
      client.create_category(name: "Dimmer")
    end

    it "returns the category" do
      category.uri.should_not be_nil
    end

    it "sends the request" do
      a_post(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".update_category" do

    let(:path) do
      "/categories/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: "Dimmer"}).to_return(body: fixture("category.json"))
    end

    let!(:category) do
      client.update_category(uri, name: "Dimmer")
    end

    it "returns the category" do
      category.uri.should_not be_nil
    end

    it "sends the request" do
      a_put(path).with(body: {name: "Dimmer"}).should have_been_made
    end
  end


  describe ".delete_category" do

    let(:path) do
      "/categories/4dcb9e23d033a9088900000a"
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture("category.json"))
    end

    let!(:category) do
      client.delete_category(uri)
    end

    it "returns the category" do
      category.uri.should_not be_nil
    end

    it "sends the request" do
      a_delete(path).should have_been_made
    end
  end
end
