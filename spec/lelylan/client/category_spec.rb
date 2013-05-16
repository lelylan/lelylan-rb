require 'helper'

describe Lelylan::Client::Category do

  let(:lelylan) do
    a_client
  end


  describe '#categories' do

    before do
      stub_get('/categories').with(query: { per: 10 }).to_return(body: fixture('categories.json'))
    end

    let!(:categories) do
      lelylan.categories(per: 10)
    end

    it 'returns the categories' do
      categories.first.name.should_not be_nil
    end

    it 'sends the request' do
      a_get('/categories').with(query: { per: 10 }).should have_been_made
    end
  end
end
