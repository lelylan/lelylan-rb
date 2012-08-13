require 'helper'

describe Lelylan::Client::Histories do

  let(:client) do
    a_client
  end


  describe '.history' do

    let(:path) do
      '/histories/4dcb9e23d033a9088900000e'
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get(path).to_return(body: fixture('history.json'))
    end

    let!(:history) do
      client.history(uri)
    end

    it 'returns the history' do
      history.uri.should_not be_nil
    end

    it 'sends the request' do
      a_get(path).should have_been_made
    end
  end


  describe '.histories' do

    let(:path) do
      '/devices/4dcb9e23d033a9088900000a'
    end

    let(:uri) do
      "http://api.lelylan.com/#{path}"
    end

    before do
      stub_get("#{path}/histories").with(query: {per: 10}).to_return(body: fixture('histories.json'))
    end

    let!(:histories) do
      client.histories(uri, per: 10)
    end

    it 'returns the histories' do
      histories.first.uri.should_not be_nil
    end

    it 'sends the request' do
      a_get("#{path}/histories").with(query: {per: 10}).should have_been_made
    end
  end
end
