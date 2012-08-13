require 'helper'

describe Lelylan::Client::Types do

  let(:client) do
    a_client
  end


  describe '.type' do

    let(:path) do
      '/types/4dcb9e23d033a9088900000a'
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture('type.json'))
    end

    let!(:type) do
      client.type(uri)
    end

    it 'returns the type' do
      type.uri.should_not be_nil
    end

    it 'sends the request' do
      a_get(path).should have_been_made
    end
  end


  describe '.types' do

    let(:path) do
      '/types'
    end

    before do
      stub_get(path).to_return(body: fixture('types.json'))
    end

    let!(:types) do
      client.types
    end

    it 'returns a list of types' do
      types.should have(1).item
    end

    it 'sends the request' do
      a_get(path).should have_been_made
    end

    context 'with params' do

      before do
        stub_get(path).with(query: {per: '25'}).to_return(body: fixture('type.json'))
      end

      before do
        client.types(per: 25)
      end

      it 'sends the params' do
        a_get(path).with(query: {per: '25'}).should have_been_made
      end
    end
  end


  describe '.public_types' do

    let(:path) do
      '/types/public'
    end

    before do
      client.user     = nil
      client.password = nil
    end

    before do
      stub_get(path).to_return(body: fixture('types.json'))
    end

    let!(:types) do
      client.public_types
    end

    it 'returns a list of types' do
      types.should have(1).item
    end

    it 'sends the request' do
      a_get('http://api.lelylan.com/types/public').should have_been_made
    end
  end


  describe '.create_type' do

    let(:path) do
      '/types'
    end

    before do
      stub_post(path).with(body: {name: 'Dimmer'}).to_return(body: fixture('type.json'))
    end

    let!(:type) do
      client.create_type(name: 'Dimmer')
    end

    it 'returns the type' do
      type.uri.should_not be_nil
    end

    it 'sends the request' do
      a_post(path).with(body: {name: 'Dimmer'}).should have_been_made
    end
  end


  describe '.update_type' do

    let(:path) do
      '/types/4dcb9e23d033a9088900000a'
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_put(path).with(body: {name: 'Dimmer'}).to_return(body: fixture('type.json'))
    end

    let!(:type) do
      client.update_type(uri, name: 'Dimmer')
    end

    it 'returns the type' do
      type.uri.should_not be_nil
    end

    it 'sends the request' do
      a_put(path).with(body: {name: 'Dimmer'}).should have_been_made
    end
  end


  describe '.delete_type' do

    let(:path) do
      '/types/4dcb9e23d033a9088900000a'
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_delete(path).to_return(body: fixture('type.json'))
    end

    let!(:type) do
      client.delete_type(uri)
    end

    it 'returns the type' do
      type.uri.should_not be_nil
    end

    it 'sends the request' do
      a_delete(path).should have_been_made
    end
  end
end
