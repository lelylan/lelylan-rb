require 'helper'

describe Lelylan::Client do

  let(:client) do
    a_client
  end

  describe '#api_endpoint' do

    after(:each) do
      Lelylan.reset
    end

    it 'sets default to http://api.lelylan.com' do
      client = Lelylan::Client.new
      client.api_endpoint.should == 'http://api.lelylan.com/'
    end

    it 'can be set' do
      Lelylan.api_endpoint = 'http://lelylan.dev'
      client = Lelylan::Client.new
      client.api_endpoint.should == 'http://lelylan.dev/'
    end

    it 'can use the alias endpoint' do
      Lelylan.endpoint = 'http://lelylan.dev'
      client = Lelylan::Client.new
      client.endpoint.should == 'http://lelylan.dev/'
    end
  end
end
