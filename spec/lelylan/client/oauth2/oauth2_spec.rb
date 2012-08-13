require 'helper'
require 'oauth2'

describe OAuth2 do

  describe 'authorization code flow' do

    let(:path) { '/types/4dcb9e23d033a9088900000a' }
    let(:uri)  { "http://api.lelylan.com/#{path}" }

    let(:client_id)     { '36963b6bd9dc1127553b57f55ea54d4cecf97e386bcecc5f9198e8dd0ed235f9' }
    let(:client_secret) { '8e6343a084320b6b11cdd3349642718c11af1af9b9f64ed4976018bdf20d0082' }
    let(:redirect_uri)  { 'http://app.dev/callback' }
    let(:site_uri)      { 'http://app.dev' }
    let(:client)        { OAuth2::Client.new(client_id, client_secret, site: site_uri) }
    let(:json_token)    { MultiJson.load(fixture('oauth2/token.json').read) }
    let(:token)         { OAuth2::AccessToken.from_hash(client, json_token) }

    # client = Lelylan::Client.new(token: token)
    # client.type(uri)
    #before { stub_get(path).to_return(body: fixture('type.json')) }

    it 'should work' do

      pp token
      #pp Faraday.post("#{site_uri}/oauth/token").status
      #a_get("#{site_uri}/oauth/token").should have_been_made

      #client = Lelylan::Client.new(token: token)
      #type  = client.type(uri)

      #type.uri.should_not be_nil
      #a_get(path).should have_been_made
    end
  end
end

