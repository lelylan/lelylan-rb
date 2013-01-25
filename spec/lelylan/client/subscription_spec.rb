require 'helper'

describe Lelylan::Client::Subscription do

  let(:lelylan) do
    Lelylan::Client.new client_id: 'isoadoisadadasa', client_secret: 'adkdakjsdhjksha'
  end

  let(:basic) do
    'Bearer aWQ6c2VjcmV0'
  end

  describe '#subscription' do

    before do
      stub_get('/subscriptions/1').to_return(body: fixture('subscription.json'))
    end

    let!(:subscription) do
      lelylan.subscription('1')
    end

    it 'returns the subscription' do
      subscription.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/subscriptions/1').with(headers: { Authorization: basic }).should have_been_made
    end
  end


  #describe '#subscriptions' do

    #before do
      #stub_get('/subscriptions').to_return(body: fixture('subscriptions.json'))
    #end

    #let!(:subscriptions) do
      #lelylan.subscriptions
    #end

    #it 'returns a list of subscriptions' do
      #subscriptions.should have(1).item
    #end

    #it 'sends the request' do
      #a_get('/subscriptions').with(headers: { Authorization: basic }).should have_been_made
    #end

    #context 'with params' do

      #before do
        #stub_get('/subscriptions').with(query: { per: '25' }).to_return(body: fixture('subscription.json'))
      #end

      #before do
        #lelylan.subscriptions(per: 25)
      #end

      #it 'sends the params' do
        #a_get('/subscriptions').with(headers: { Authorization: basic }).with(query: { per: '25' }).should have_been_made
      #end
    #end
  #end


  #describe '#create_subscription' do

    #before do
      #stub_post('/subscriptions').with(headers: { Authorization: basic }).with(body: { name: 'Bedroom' }).to_return(body: fixture('subscription.json'))
    #end

    #let!(:subscription) do
      #lelylan.create_subscription(name: 'Bedroom')
    #end

    #it 'returns the subscription' do
      #subscription.id.should_not be_nil
    #end

    #it 'sends the request' do
      #a_post('/subscriptions').with(headers: { Authorization: basic }).with(body: { name: 'Bedroom' }).should have_been_made
    #end
  #end


  #describe '#update_subscription' do

    #before do
      #stub_put('/subscriptions/1').with(body: { name: 'Bedroom' }).to_return(body: fixture('subscription.json'))
    #end

    #let!(:subscription) do
      #lelylan.update_subscription('1', name: 'Bedroom')
    #end

    #it 'returns the subscription' do
      #subscription.id.should_not be_nil
    #end

    #it 'sends the request' do
      #a_put('/subscriptions/1').with(headers: { Authorization: basic }).with(body: { name: 'Bedroom' }).should have_been_made
    #end
  #end


  #describe '#delete_subscription' do

    #before do
      #stub_delete('/subscriptions/1').to_return(body: fixture('subscription.json'))
    #end

    #let!(:subscription) do
      #lelylan.delete_subscription('1')
    #end

    #it 'returns the subscription' do
      #subscription.id.should_not be_nil
    #end

    #it 'sends the request' do
      #a_delete('/subscriptions/1').with(headers: { Authorization: basic }).should have_been_made
    #end
  #end
end
