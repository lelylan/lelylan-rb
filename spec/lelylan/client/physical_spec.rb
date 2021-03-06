require 'helper'

describe Lelylan::Client::Type do

  let(:lelylan) do
    Lelylan::Client.new
  end

  describe '#physical_properties' do

    before do
      stub_request(:put, 'http://mqtt.lelylan.com/devices/1').to_return(status: 202, body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.physical_properties('http://mqtt.lelylan.com/devices/1', 'secret', { properties: {} })
    end

    it 'returns the type' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      stub_request(:put, 'http://mqtt.lelylan.com/devices/1').should have_been_made
    end
  end
end
