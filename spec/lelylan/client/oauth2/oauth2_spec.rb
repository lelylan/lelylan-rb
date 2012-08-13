require 'helper'
require 'oauth2'

describe OAuth2 do

  let(:client_id)     { '36963b6bd9dc1127553b57f55ea54d4cecf97e386bcecc5f9198e8dd0ed235f9' }
  let(:client_secret) { '8e6343a084320b6b11cdd3349642718c11af1af9b9f64ed4976018bdf20d0082' }
  let(:redirect_uri)  { 'http://app.dev/callback' }
  let(:site_uri)      { 'http://app.dev' }
  let(:application)   { OAuth2::Client.new client_id, client_secret, site: site_uri }
  let(:json_token)    { MultiJson.load fixture('oauth2/token.json').read }
  let(:token)         { OAuth2::AccessToken.from_hash application, json_token }

  let(:client)  { Lelylan::Client.new token: token }
  let(:path)    { '/types/4dcb9e23d033a9088900000a' }
  let(:uri)     { "http://api.lelylan.com/#{path}" }
  let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }

  context 'with not expired token' do

    before { stub_get(path).with(headers: headers).to_return(body: fixture('type.json')) }
    before { client.type uri }

    it 'adds the oauth2 token in the header' do
      a_get(path).with(headers: headers).should have_been_made
    end
  end

  context 'with expired token' do

    let(:refresh_uri)     { "#{site_uri}/oauth/token" }
    let(:refresh_token)   { MultiJson.load fixture('oauth2/refresh.json').read }
    let(:refresh_headers) { { 'Content-Type' => 'application/json' } }
    let(:headers)         { { 'Authorization' => "Bearer #{refresh_token['access_token']}" } }

    let(:refresh_body) {{
      client_id:     client_id, 
      client_secret: client_secret, 
      grant_type:    'refresh_token',
      refresh_token: token.refresh_token
    }}

    before { stub_post(refresh_uri).with(body: refresh_body).to_return(headers: refresh_headers, body: refresh_token) }
    before { stub_get(path).with(headers: headers).to_return(body: fixture('type.json')) }
    before { token.instance_variable_set '@expires_at', 0 }

    it 'expires token' do
      token.expired?.should == true
    end

    it 'refreshes token' do
      expect{ client.type uri }.to change{ client.token.token }
    end
  end
end

