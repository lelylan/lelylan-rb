require 'helper'

describe Lelylan::Client::Statuses do

  let(:lelylan) do
    a_client
  end

  describe '#status' do

    before do
      stub_get('/statuses/1').to_return(body: fixture('status.json'))
    end

    let!(:status) do
      lelylan.status('1')
    end

    it 'returns the status' do
      status.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/statuses/1').should have_been_made
    end
  end


  describe '#statuses' do

    before do
      stub_get('/statuses').to_return(body: fixture('statuses.json'))
    end

    let!(:statuses) do
      lelylan.statuses
    end

    it 'returns a list of statuses' do
      statuses.should have(1).item
    end

    it 'sends the request' do
      a_get('/statuses').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/statuses').with(query: { per: '25' }).to_return(body: fixture('status.json'))
      end

      before do
        lelylan.statuses(per: 25)
      end

      it 'sends the params' do
        a_get('/statuses').with(query: { per: '25' }).should have_been_made
      end
    end
  end



  describe '#public_statuses' do

    before do
      stub_get('/statuses/public').to_return(body: fixture('statuses.json'))
    end

    let!(:statuses) do
      lelylan.public_statuses
    end

    it 'returns a list of statuses' do
      statuses.should have(1).item
    end

    it 'sends the request' do
      a_get('/statuses/public').should have_been_made
    end

    context 'with params' do

      before do
        stub_get('/statuses/public').with(query: { per: '25' }).to_return(body: fixture('status.json'))
      end

      before do
        lelylan.public_statuses(per: 25)
      end

      it 'sends the params' do
        a_get('/statuses/public').with(query: { per: '25' }).should have_been_made
      end
    end
  end


  describe '#create_status' do

    before do
      stub_post('/statuses').with(body: { name: 'Setting Intensity' }).to_return(body: fixture('status.json'))
    end

    let!(:status) do
      lelylan.create_status(name: 'Setting Intensity')
    end

    it 'returns the status' do
      status.id.should_not be_nil
    end

    it 'sends the request' do
      a_post('/statuses').with(body: { name: 'Setting Intensity' }).should have_been_made
    end
  end


  describe '#update_status' do

    before do
      stub_put('/statuses/1').with(body: { name: 'Setting Intensity' }).to_return(body: fixture('status.json'))
    end

    let!(:status) do
      lelylan.update_status('1', name: 'Setting Intensity')
    end

    it 'returns the status' do
      status.id.should_not be_nil
    end

    it 'sends the request' do
      a_put('/statuses/1').with(body: { name: 'Setting Intensity' }).should have_been_made
    end
  end


  describe '#delete_status' do

    before do
      stub_delete('/statuses/1').to_return(body: fixture('status.json'))
    end

    let!(:status) do
      lelylan.delete_status('1')
    end

    it 'returns the status' do
      status.id.should_not be_nil
    end

    it 'sends the request' do
      a_delete('/statuses/1').should have_been_made
    end
  end
end
