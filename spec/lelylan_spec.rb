require 'helper'

describe Lelylan do

  after do
    Lelylan.reset
  end

  let(:client) do
    a_client
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      Lelylan.respond_to?(:new, true).should be_true
    end
  end

  describe ".new" do
    it "should be a Lelylan::Client" do
      Lelylan.new.should be_a Lelylan::Client
    end
  end

  describe ".delegate" do
    it "should delegate missing methods to Lelylan::Client" do
      stub_get("/devices").to_return(body: fixture('/devices.json'))
      devices = client.devices
      devices.first.uri.should_not be_nil
    end
  end
end
