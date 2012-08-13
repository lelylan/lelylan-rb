if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start { add_filter "/spec" }
end

require 'lelylan'
require 'rspec'
require 'webmock/rspec'

def a_client
  Lelylan::Client.new(user: 'foo', password: 'bar')
end

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
