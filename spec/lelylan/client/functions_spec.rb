require 'helper'

describe Lelylan::Client::Functions do

  let(:lelylan) do
    a_client
  end

  describe '#type' do

    before do
      stub_get('/types/1').to_return(body: fixture('type.json'))
    end

    let!(:type) do
      lelylan.type('1')
    end

    it 'returns the type' do
      type.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/types/1').should have_been_made
    end
  end


  describe '#types' do

    before do
      stub_get('/types').to_return(body: fixture('types.json'))
    end

    let!(:types) do
      lelylan.types
    end

    it 'returns a list of types' do
      types.should have(1).item
    end

    it 'sends the request' do
      a_get('/types').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/types').with(query: { per: '25' }).to_return(body: fixture('type.json'))
      end

      before do
        lelylan.types(per: 25)
      end

      it 'sends the params' do
        a_get('/types').with(query: { per: '25' }).should have_been_made
      end
    end
  end



  describe '#public_types' do

    before do
      stub_get('/types/public').to_return(body: fixture('types.json'))
    end

    let!(:types) do
      lelylan.public_types
    end

    it 'returns a list of types' do
      types.should have(1).item
    end

    it 'sends the request' do
      a_get('/types/public').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/types/public').with(query: { per: '25' }).to_return(body: fixture('type.json'))
      end

      before do
        lelylan.public_types(per: 25)
      end

      it 'sends the params' do
        a_get('/types/public').with(query: { per: '25' }).should have_been_made
      end
    end
  end


  describe '#create_type' do

    before do
      stub_post('/types').with(body: { name: 'Set Intensity' }).to_return(body: fixture('type.json'))
    end

    let!(:type) do
      lelylan.create_type(name: 'Set Intensity')
    end

    it 'returns the type' do
      type.id.should_not be_nil
    end

    it 'sends the request' do
      a_post('/types').with(body: { name: 'Set Intensity' }).should have_been_made
    end
  end


  describe '#update_type' do

    before do
      stub_put('/types/1').with(body: { name: 'Set Intensity' }).to_return(body: fixture('type.json'))
    end

    let!(:type) do
      lelylan.update_type('1', name: 'Set Intensity')
    end

    it 'returns the type' do
      type.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/types/1').with(body: { name: 'Set Intensity' }).should have_been_made
    end
  end


  describe '#delete_type' do

    before do
      stub_delete('/types/1').to_return(body: fixture('type.json'))
    end

    let!(:type) do
      lelylan.delete_type('1')
    end

    it 'returns the type' do
      type.id.should_not be_nil
    end

    it 'sends the request' do
      a_delete('/types/1').should have_been_made
    end
  end
end
