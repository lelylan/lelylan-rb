require 'helper'

describe Lelylan::Client::Subscription do

  let(:lelylan) do
    Lelylan::Client.new client_id: 'id', client_secret: 'secret'
  end

  let(:basic) do
    'Bearer aWQ6c2VjcmV0'
  end

  describe '#subscription' do

    before do
      stub_request(:get, 'http://id:secret@api.lelylan.com/subscriptions/1').to_return(body: fixture('subscription.json'))
    end

    let!(:subscription) do
      lelylan.subscription('1')
    end

    it 'returns the subscription' do
      subscription.id.should_not be_nil
    end

    it 'sends the request' do
      a_request(:get, 'http://id:secret@api.lelylan.com/subscriptions/1').should have_been_made
    end
  end


  describe '#subscriptions' do

    before do
      stub_request(:get, 'http://id:secret@api.lelylan.com/subscriptions').to_return(body: fixture('subscriptions.json'))
    end

    let!(:subscriptions) do
      lelylan.subscriptions
    end

    it 'returns a list of subscriptions' do
      subscriptions.should have(1).item
    end

    it 'sends the request' do
      a_request(:get, 'http://id:secret@api.lelylan.com/subscriptions').should have_been_made
    end

    context 'with params' do

      before do
        stub_request(:get, 'http://id:secret@api.lelylan.com/subscriptions').with(query: { per: '25' }).to_return(body: fixture('subscription.json'))
      end

      before do
        lelylan.subscriptions(per: 25)
      end

      it 'sends the params' do
        a_request(:get, 'http://id:secret@api.lelylan.com/subscriptions').with(query: { per: '25' }).should have_been_made
      end
    end
  end


  describe '#create_subscription' do

    before do
      stub_request(:post, 'http://id:secret@api.lelylan.com/subscriptions').with(body: { event: 'property-update' }).to_return(body: fixture('subscription.json'))
    end

    let!(:subscription) do
      lelylan.create_subscription(event: 'property-update')
    end

    it 'returns the subscription' do
      subscription.id.should_not be_nil
    end

    it 'sends the request' do
      a_request(:post, 'http://id:secret@api.lelylan.com/subscriptions').with(body: { event: 'property-update' }).should have_been_made
    end
  end


  describe '#update_subscription' do

    before do
      stub_request(:put, 'http://id:secret@api.lelylan.com/subscriptions/1').with(body: { event: 'delete' }).to_return(body: fixture('subscription.json'))
    end

    let!(:subscription) do
      lelylan.update_subscription('1', event: 'delete')
    end

    it 'returns the subscription' do
      subscription.id.should_not be_nil
    end

    it 'sends the request' do
      a_request(:put, 'http://id:secret@api.lelylan.com/subscriptions/1').with(body: { event: 'delete' }).should have_been_made
    end
  end


  describe '#delete_subscription' do

    before do
      stub_request(:delete, 'http://id:secret@api.lelylan.com/subscriptions/1').to_return(body: fixture('subscription.json'))
    end

    let!(:subscription) do
      lelylan.delete_subscription('1')
    end

    it 'returns the subscription' do
      subscription.id.should_not be_nil
    end

    it 'sends the request' do
      a_request(:delete, 'http://id:secret@api.lelylan.com/subscriptions/1').should have_been_made
    end
  end


  describe 'when a client param misses' do

    let(:client) do
      Lelylan::Client.new client_id: 'id'
    end

    describe '#subscription' do

      before do
        stub_request(:get, 'http://id:secret@api.lelylan.com/subscriptions/1').to_return(body: fixture('subscription.json'))
      end

      it 'raises a Lelylan::Error' do
        expect{ client.subscription('1') }.to raise_error(Lelylan::Error, /you need both client id and client secret/)
      end
    end
  end
end
