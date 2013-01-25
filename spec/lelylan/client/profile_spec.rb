require 'helper'

describe Lelylan::Client::Profile do

  let(:lelylan) do
    a_client
  end

  describe '#me' do

    before do
      stub_get('/me').to_return(body: fixture('profile.json'))
    end

    let!(:profile) do
      lelylan.me()
    end

    it 'returns the type' do
      profile.id.should_not be_nil
    end

    it 'sends the request' do
      a_get('/me').should have_been_made
    end
  end
end
