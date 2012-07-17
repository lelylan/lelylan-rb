require 'helper'

describe Lelylan::Client do

  let(:client) do
    a_client
  end

  it 'adds basic auth' do

    stub_get("http://foo:bar@api.lelylan.com/devices").
      with(:headers => {'Accept'=>'*/*'}).
      to_return(:status => 200, :body => '{"devices":[]}', :headers => {})

    Lelylan::Client.new(:user => 'foo', :password => 'bar').devices
    a_get('/devices').should have_been_made
  end


  describe "#api_endpoint" do

    after(:each) do
      Lelylan.reset
    end

    it "sets default to http://api.lelylan.com" do
      client = Lelylan::Client.new
      client.endpoint.should == 'http://api.lelylan.com/'
    end

    it "can be set" do
      Lelylan.endpoint = 'http://lelylan.dev'
      client = Lelylan::Client.new
      client.api_endpoint.should == 'http://lelylan.dev/'
    end
  end
end
