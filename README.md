# Lelylan Ruby Gem

Ruby client library for [Lelylan API](http://dev.lelylan.com)

## Introduction

#### What is Lelylan

[Lelylan](http://lelylan.com) makes it easy for developers to monitor and control all devices
in your house providing a simple and consistent REST API.


## Requirements

Ruby client library is tested against MRI 1.9.3.


## Installation

Install the client using Bundler.

```ruby
gem 'lelylan-rb', require: 'lelylan'
gem 'oauth2'
```

Development version.

```ruby
gem 'lelylan-rb', require: 'lelylan', git: 'https://github.com/lelylan/lelylan-rb'
```

## Getting started

### Require Gem

```ruby
require 'lelylan'
require 'oauth2'
```

### Get an access token

First of all you need an access token to authoraze your requests in
Lelylan. To get one use the [OAuth2 gem](https://github.com/intridea/oauth2/)
and if you are not used to OAuth2 concepts, take 10 minutes and read the
related documentation in the [dev center](http://dev.lelylan.com/api/oauth#language=node).


```ruby
# Create a client
oauth = OAuth2::Client.new(client_id, client_secret, site: site)

# Redirect the application to the Lelylan authorization page
redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri, scope: scope)
# => http://people.lelylan.com/oauth/authorize?
#      redirect_uri=http://localhost:3000/callback&
#      scope=<scope>&response_type=code&client_id=<client-id>

# Get the access token object (authorization code is given from the previous step)
token = oauth.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
```

### Lelylan access

Once you have the access token you can access to the Lelylan API. The
following example shows how to print in the console a list of owned devices.

```ruby
# Initialize Lelylan client
lelylan = Lelylan::Client.new(token: token)

# Get the first device where the name matches with Dimmer.
device = lelylan.devices(name: 'Dimmer').first

# The client returns an Hashie (https://github.com/intridea/hashie)
puts device.uri # get the device uri
puts device.properties.first.value # get the first device property value
```

### Realtime services

When using the [subscription](http://dev.lelylan.com/api/realtime#language=node) services
you don't need an access token. In this case what you need is to set the client credentials.

```ruby
lelylan = Lelylan::Client.new(client_id:'<client-id>', client_secret: '<client-secret>')
subscriptions = lelylan.subscriptions
```

### Implemented Services

Learn how to use Lelylan and AngulasJS in deep.

- [x] [Devices](http://dev.lelylan.com/api/devices#angular).
- [x] [Activations](http://dev.lelylan.com/api/devices#angular).
- [x] [Types](http://dev.lelylan.com/api/types#angular).
- [x] [Properties](http://dev.lelylan.com/api/types/properties#angular).
- [x] [Functions](http://dev.lelylan.com/api/types/functions#angular).
- [x] [Statuses](http://dev.lelylan.com/api/types/statuses#angular).
- [x] [Physical devices](http://dev.lelylan.com/api/physicals#angular).
- [x] [Subscriptions](http://dev.lelylan.com/api/realtime#angular).
- [x] [User Profile](http://dev.lelylan.com/api/core#get-a-user-angular).
- [x] [OAuth2](http://dev.lelylan.com/api/oauth#implicit-grant-angular).


### Authorization flows

#### Authorization code flows

```ruby
oauth = OAuth2::Client.new(client_id, client_secret, site: site)
redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
token = oauth.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
```

#### Implicit grant flow

```ruby
oauth = OAuth2::Client.new(client_id, client_secret, site: site)
redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
token = OAuth2::AccessToken.from_kvform(client, params)
```

#### Resource owner password credentials flow

```ruby
oauth = OAuth2::Client.new(client_id, client_secret, site: site)
token = oauth.password.get_token('email', 'password')
```

Access tokens, when expired, are automatically refreshed.


### Errors

Exceptions are raised when a 4xx or 5xx status code is returned.

    Lelylan::BadRequest            # 400
    Lelylan::Unauthorized          # 401
    Lelylan::Forbidden             # 403
    Lelylan::NotFound              # 404
    Lelylan::NotAcceptable         # 406
    Lelylan::NotValid              # 422
    Lelylan::InternalServerError   # 500
    Lelylan::NotImplemented        # 501
    Lelylan::BadGateway            # 502
    Lelylan::ServiceUnavailable    # 503


Through the error message attribute you can access the error information.

```ruby
begin
  device = lelylan.device('<id>')
rescue Lelylan::Error => e
  puts e.message
end
```

Unluckily the `#message` method can only be a string. For this reason we
can't return a JSON structure when lelylan offers it, but we return the
`error.description` value.
Learn more about [errors on Lelylan](http://dev.lelylan.com/api/core#errors).


### Configurations

#### API endpoint

Configuration block.

```ruby
Lelylan.configure { |c| c.endpoint = 'https://localhost:8000' }
lelylan = Lelylan::Client.new(token: token)
```

Client instance.

```ruby
lelylan = Lelylan::Client.new(token: token)
lelylan.endpoint = 'https://lelylan.yourhouse.com'
```


## Contributing

Fork the repo on github and send a pull requests with topic branches. Do not forget to
provide specs to your contribution.


### Running specs

* Fork and clone the repository.
* Run `gem install bundler` to get the latest for the gemset.
* Run `bundle install` for dependencies.
* Run `bundle exec guard` and press enter to execute all specs.

### Running locally

Whenever you want to use the source code from your IRB session simply import `lib/`.

```
$ git clone https://github.com/lelylan/lelylan-rb
$ cd lelylan-rb
$ irb -I lib/
$ > require 'lelylan'
```

### Spec guidelines

Follow [rspec best practices](http://betterspecs.org) guidelines.


### Coding guidelines

Follow [github](https://github.com/styleguide/) guidelines.


### Feedback

Use the [issue tracker](http://github.com/lelylan/lelylan-rb/issues) for bugs.
[Mail](mailto:touch@lelylan.com) or [Tweet](http://twitter.com/lelylan) us for any idea that can improve the project.


### Links

* [GIT Repository](http://github.com/lelylan/lelylan-rb)
* [Lelylan Ruby Website](http://lelylan.github.com/lelylan-rb).
* [Lelylan Dev Center](http://dev.lelylan.com)
* [Lelylan Site](http://lelylan.com)


## Authors

[Andrea Reginato](http://twitter.com/andreareginato)


## Contributors

Special thanks to the following people for submitting patches.


## Changelog

See [CHANGELOG](https://github.com/lelylan/lelylan-rb/blob/master/CHANGELOG.md)


## Copyright

Copyright (c) 2013 [Lelylan](http://lelylan.com).
See [LICENSE](https://github.com/lelylan/lelylan-rb/blob/master/LICENSE.md) for details.
