if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start { add_filter "/spec" }
end

require 'lelylan'
require 'rspec'
require 'webmock/rspec'

def a_delete(url)
  a_request(:delete, lelylan_url(url))
end

def a_get(url)
  a_request(:get, lelylan_url(url))
end

def a_patch(url)
  a_request(:patch, lelylan_url(url))
end

def a_post(url)
  a_request(:post, lelylan_url(url))
end

def a_put(url)
  a_request(:put, lelylan_url(url))
end

def stub_delete(url)
  stub_request(:delete, lelylan_url(url))
end

def stub_get(url)
  stub_request(:get, lelylan_url(url))
end

def stub_patch(url)
  stub_request(:patch, lelylan_url(url))
end

def stub_post(url)
  stub_request(:post, lelylan_url(url))
end

def stub_put(url)
  stub_request(:put, lelylan_url(url))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def lelylan_url(url)
  url =~ /^http/ ? url : "http://api.lelylan.com#{url}"
end

def a_client
  client_id     = '36963b6bd9dc1127553b57f55ea54d4cecf97e386bcecc5f9198e8dd0ed235f9'
  client_secret = '8e6343a084320b6b11cdd3349642718c11af1af9b9f64ed4976018bdf20d0082'
  site_uri      = 'http://app.dev'
  application   = OAuth2::Client.new client_id, client_secret, site: site_uri
  json_token    = MultiJson.load fixture('oauth2/token.json').read
  token         = OAuth2::AccessToken.from_hash application, json_token

  Lelylan::Client.new token: token
end
