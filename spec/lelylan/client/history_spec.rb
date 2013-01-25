require 'helper'

describe Lelylan::Client::History do

  let(:lelylan) do
    a_client
  end


  describe '#find_history' do

    before do
      stub_get('/histories/1').to_return(body: fixture('history.json'))
    end

    let!(:history) do
      lelylan.find_history('1')
    end

    it 'returns the history' do
      history.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/histories/1').should have_been_made
    end
  end


  describe '#all_histories' do

    before do
      stub_get('/histories').with(query: {per: 10}).to_return(body: fixture('histories.json'))
    end

    let!(:histories) do
      lelylan.all_histories(per: 10)
    end

    it 'returns the histories' do
      histories.first.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/histories').with(query: {per: 10}).should have_been_made
    end
  end
end
