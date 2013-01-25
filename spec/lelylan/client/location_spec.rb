require 'helper'

describe Lelylan::Client::Location do

  let(:lelylan) do
    a_client
  end

  describe '#location' do

    before do
      stub_get('/locations/1').to_return(body: fixture('location.json'))
    end

    let!(:location) do
      lelylan.location('1')
    end

    it 'returns the location' do
      location.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/locations/1').should have_been_made
    end
  end


  describe '#locations' do

    before do
      stub_get('/locations').to_return(body: fixture('locations.json'))
    end

    let!(:locations) do
      lelylan.locations
    end

    it 'returns a list of locations' do
      locations.should have(1).item
    end

    it 'sends the request' do
      a_get('/locations').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/locations').with(query: { per: '25' }).to_return(body: fixture('location.json'))
      end

      before do
        lelylan.locations(per: 25)
      end

      it 'sends the params' do
        a_get('/locations').with(query: { per: '25' }).should have_been_made
      end
    end
  end


  describe '#create_location' do

    before do
      stub_post('/locations').with(body: { name: 'Bedroom' }).to_return(body: fixture('location.json'))
    end

    let!(:location) do
      lelylan.create_location(name: 'Bedroom')
    end

    it 'returns the location' do
      location.id.should_not be_nil
    end

    it 'sends the request' do
      a_post('/locations').with(body: { name: 'Bedroom' }).should have_been_made
    end
  end


  describe '#update_location' do

    before do
      stub_put('/locations/1').with(body: { name: 'Bedroom' }).to_return(body: fixture('location.json'))
    end

    let!(:location) do
      lelylan.update_location('1', name: 'Bedroom')
    end

    it 'returns the location' do
      location.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/locations/1').with(body: { name: 'Bedroom' }).should have_been_made
    end
  end


  describe '#delete_location' do

    before do
      stub_delete('/locations/1').to_return(body: fixture('location.json'))
    end

    let!(:location) do
      lelylan.delete_location('1')
    end

    it 'returns the location' do
      location.id.should_not be_nil
    end

    it 'sends the request' do
      a_delete('/locations/1').should have_been_made
    end
  end
end
