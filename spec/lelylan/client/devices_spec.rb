require 'helper'

describe Lelylan::Client::Devices do

  let(:lelylan) do
    a_client
  end

  describe '#find_device' do

    let(:id) do
      '4dcb9e23d033a9088900000a'
    end

    let(:uri) do
      'http://api.lelylan.com/devices/1'
    end

    before do
      stub_get('/devices/1').to_return(body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.find_device('1')
    end

    it 'returns the device' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/devices/1').should have_been_made
    end
  end


  describe '#all_devices' do

    let(:path) do
      '/devices'
    end

    before do
      stub_get('/devices').to_return(body: fixture('devices.json'))
    end

    let!(:devices) do
      lelylan.all_devices
    end

    it 'returns a list of devices' do
      devices.should have(1).item
    end

    it 'sends the request' do
      a_get('/devices').should have_been_made
    end

    context 'with params' do

      before do
        stub_get(path).with(query: {per: '25'}).to_return(body: fixture('device.json'))
      end

      before do
        lelylan.all_devices(per: 25)
      end

      it 'sends the params' do
        a_get('/devices').with(query: {per: '25'}).should have_been_made
      end
    end
  end


  describe '#create_device' do

    before do
      stub_post('/devices').with(body: {name: 'Dimmer'}).to_return(body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.create_device(name: 'Dimmer')
    end

    it 'returns the device' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      a_post('/devices').with(body: {name: 'Dimmer'}).should have_been_made
    end
  end


  describe '#update_device' do

    before do
      stub_put('/devices/1').with(body: {name: 'Dimmer'}).to_return(body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.update_device('1', name: 'Dimmer')
    end

    it 'returns the device' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/devices/1').with(body: {name: 'Dimmer'}).should have_been_made
    end
  end


  describe '#delete_device' do

    before do
      stub_delete('/devices/1').to_return(body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.delete_device('1')
    end

    it 'returns the device' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      a_delete('/devices/1').should have_been_made
    end
  end


  describe '#execute' do

    let(:function) do
      'http://api.lelylan.com/functions/4dcb9e23d033a9088900020a'
    end

    let(:properties) do
      [ { uri: 'http://api.lelylan.com/properties/4dcb9e23d033a9088900020a', value: '50' } ]
    end

    before do
      stub_put('/devices/1/functions').with(body: { properties: properties, function: function }).to_return(body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.execute('1', { function: function, properties: properties })
    end

    it 'returns the updated device' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/devices/1/functions').with(body: { properties: properties, function: function }).should have_been_made
    end
  end


  describe '.device_properties' do

    let(:properties) do
      [{uri: 'http://api.lelylan.com/properties/4dcb9e23d033a9088900020a', value: '50'}]
    end

    before do
      stub_put("/devices/1/properties").with(body: { properties: properties }).to_return(body: fixture('device.json'))
    end

    let!(:device) do
      lelylan.device_properties('1', properties: properties)
    end

    it 'returns the updated device' do
      device.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/devices/1/properties').with(body: { properties: properties }).should have_been_made
    end
  end
end
