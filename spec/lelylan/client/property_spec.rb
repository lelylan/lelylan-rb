require 'helper'

describe Lelylan::Client::Property do


  let(:lelylan) do
    a_client
  end

  describe '#property' do

    before do
      stub_get('/properties/1').to_return(body: fixture('property.json'))
    end

    let!(:property) do
      lelylan.property('1')
    end

    it 'returns the property' do
      property.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/properties/1').should have_been_made
    end
  end


  describe '#properties' do

    before do
      stub_get('/properties').to_return(body: fixture('properties.json'))
    end

    let!(:properties) do
      lelylan.properties
    end

    it 'returns a list of properties' do
      properties.should have(1).item
    end

    it 'sends the request' do
      a_get('/properties').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/properties').with(query: { per: '25' }).to_return(body: fixture('property.json'))
      end

      before do
        lelylan.properties(per: 25)
      end

      it 'sends the params' do
        a_get('/properties').with(query: { per: '25' }).should have_been_made
      end
    end
  end


  describe '#public_properties' do

    before do
      stub_get('/properties/public').to_return(body: fixture('properties.json'))
    end

    let!(:properties) do
      lelylan.public_properties
    end

    it 'returns a list of properties' do
      properties.should have(1).item
    end

    it 'sends the request' do
      a_get('/properties/public').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/properties/public').with(query: { per: '25' }).to_return(body: fixture('property.json'))
      end

      before do
        lelylan.public_properties(per: 25)
      end

      it 'sends the params' do
        a_get('/properties/public').with(query: { per: '25' }).should have_been_made
      end
    end
  end


  describe '#create_property' do

    before do
      stub_post('/properties').with(body: { name: 'Status' }).to_return(body: fixture('property.json'))
    end

    let!(:property) do
      lelylan.create_property(name: 'Status')
    end

    it 'returns the property' do
      property.id.should_not be_nil
    end

    it 'sends the request' do
      a_post('/properties').with(body: { name: 'Status' }).should have_been_made
    end
  end


  describe '#update_property' do

    before do
      stub_put('/properties/1').with(body: { name: 'Status' }).to_return(body: fixture('property.json'))
    end

    let!(:property) do
      lelylan.update_property('1', name: 'Status')
    end

    it 'returns the property' do
      property.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/properties/1').with(body: { name: 'Status' }).should have_been_made
    end
  end


  describe '#delete_property' do

    before do
      stub_delete('/properties/1').to_return(body: fixture('property.json'))
    end

    let!(:property) do
      lelylan.delete_property('1')
    end

    it 'returns the property' do
      property.id.should_not be_nil
    end

    it 'sends the request' do
      a_delete('/properties/1').should have_been_made
    end
  end
end

