require 'helper'

describe OAuth2 do

  let(:application)   { OAuth2::Client.new 'client-id', 'client-secret', site: 'http://oauth2.dev' }
  let(:json_token)    { MultiJson.load fixture('oauth2/token.json').read }
  let(:token)         { OAuth2::AccessToken.from_hash application, json_token }
  let(:lelylan)       { Lelylan::Client.new token: token }
  let(:headers)       { { 'Authorization' => "Bearer #{token.token}" } }
  let(:redirect_uri)  { 'http://app.dev/callback' }

  context 'with not expired token' do

    before { stub_get('/devices/1').with(headers: headers).to_return(body: fixture('device.json')) }
    before { lelylan.device('1') }

    it 'adds the oauth2 token in the header' do
      a_get('/devices/1').with(headers: headers).should have_been_made
    end
  end

  context 'with expired token' do

    let(:refresh_uri)     { 'http://oauth2.dev/oauth/token' }
    let(:refresh_headers) { { 'Content-Type' => 'application/json' } }
    let(:refresh_token)   { MultiJson.load fixture('oauth2/refresh.json').read }
    let(:headers)         { { 'Authorization' => "Bearer #{refresh_token['access_token']}" } }

    let(:refresh_body) {{
      client_id:     'client-id',
      client_secret: 'client-secret',
      grant_type:    'refresh_token',
      refresh_token: token.refresh_token
    }}

    before { stub_post(refresh_uri).with(body: refresh_body).to_return(headers: refresh_headers, body: refresh_token) }
    before { stub_get('/devices/1').with(headers: headers).to_return(body: fixture('device.json')) }
    before { token.instance_variable_set '@expires_at', 0 }

    it 'expires token' do
      token.expired?.should == true
    end

    it 'refreshes token' do
      expect{ lelylan.device('1') }.to change{ lelylan.token.token }
    end
  end
end
