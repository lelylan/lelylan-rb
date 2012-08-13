# Lelylan Ruby Gem

Ruby wrapper for [Lelylan API](http://dev.lelylan.com)


## Requirements

People API is tested against MRI 1.9.3.


## Installation

Install gem using Bundler.

    gem 'lelylan-rb', require: 'lelylan'

Development version.

    gem 'lelylan-rb', require: 'lelylan', git: 'https://github.com/lelylan/lelylan-rb', branch: 'dev'


## Resources

* [Ruby gem documentation](http://rdoc.info/gems/lelylan-rb)
* [Lelylan API](http://dev.lelylan.com)


## Getting started

Require gems.

    require 'rubygems'
    require 'lelylan-rb'


### Create the access token

Create a client (uses the [OAuth2 gem](https://github.com/intridea/oauth2/)).

    oauth = OAuth2::Client.new(client_id, client_secret, site: site)

Redirect the application to the Lelylan authorization page.

    redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)

Create the access token. The params[:code] contains the authorization
code created from Lelylan and sent to the redirect_uri.

    token = oauth.auth_code.get_token(params[:code], redirect_uri: redirect_uri)

### Create the Lelylan client.

    client = Lelylan::Client.new(token: token)

### Access Lelylan API

Get 10 devices.

    client.devices(per: 10)

Get a device based on its URI.

    client.device('http://api.lelylan.com/devices/:id')

Search a device based on its name.

    client.devices(name: 'Dimmer').first

Create a device (in this case we suppose the type is a dimmer)

    device = client.create_device(name: 'Closet dimmer', type_uri: dimmer.uri)

Execute a function.

    client.execute(device.uri, function.uri)

Get a public type based on its URI. Remember, when a resource is public the client
with a token is not needed.

    Lelylan.type('http://api.lelylan.com/types/:id')


## More examples

For more examples check out the [ruby gem documentation](http://rdoc.info/gems/lelylan-rb).

* [Device examples](docs/Lelylan/Client/Devices)
* [Consumption examples](docs/Lelylan/Client/Consumptions)
* [Hisotry examples](docs/Lelylan/Client/Histories)
* [Types examples](docs/Lelylan/Client/Types)
* [Properties examples](docs/Lelylan/Client/Properties)
* [Functions examples](docs/Lelylan/Client/Functions)
* [Statuses examples](docs/Lelylan/Client/Statuses)
* [Categories examples](docs/Lelylan/Client/Categories)
* [Locations examples](docs/Lelylan/Client/Locations)

## Authorization flows

Lelylan support four OAuth2 authorization flows.

### Authorization code flows

    oauth = OAuth2::Client.new(client_id, client_secret, site: site)
    redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
    token = oauth.auth_code.get_token(params[:code], redirect_uri: redirect_uri)

### Implicit grant flow

    oauth = OAuth2::Client.new(client_id, client_secret, site: site)
    redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
    token = OAuth2::AccessToken.from_kvform(client, params)

### Resource owner password credentials flow

    oauth = OAuth2::Client.new(client_id, client_secret, site: site)
    token = oauth.password.get_token('email', 'password')

### Client credentials flow

    token = oauth.client_credentials.get_token

All access tokens, when expired, are automatically refreshed.


## Settings

### API endpoint

Configuration block.

    Lelylan.configure { |c| c.endpoint = 'https://lelylan.yourhouse.com' }
    @client = Lelylan::Client.new(token: token)

Client instance.

    @client = Lelylan::Client.new(token: token)
    @client.endpoint = 'https://lelylan.yourhouse.com'


## Errors

Exceptions are raised when a 4xx or 5xx status code is returned.

    Lelylan::BadRequest            # 400
    Lelylan::Unauthorized          # 401
    Lelylan::NotFound              # 404
    Lelylan::NotValid              # 422
    Lelylan::InternalServerError   # 500
    Lelylan::BadGateway            # 502
    Lelylan::ServiceUnavailable    # 503


Through the error message attribute you can access the error information.

    begin
      @type = Lelylan::Type.type("https://type.lelylan.com/types/not_existing_uri")
    rescue Lelylan::NotFound => e
      puts "The resource #{e.message.error.uri} was not found"
    end

Learn more about the [error response structure](http://dev.lelylan.com/rest/core/#errors).


## Contributing

Fork the repo on github and send a pull requests with topic branches. Do not forget to 
provide specs to your contribution.


### Running specs

* Fork and clone the repository.
* Run `gem install bundler` to get the latest for the gemset.
* Run `bundle install` for dependencies.
* Run `bundle exec guard` and press enter to execute all specs.


## Spec guidelines

Follow [rspec best practices](https://docs.google.com/document/d/1gi00-wwPaLk5VvoAJhBVNh9Htw4Rwmj-Ut88T4M2MwI/edit?hl=en#) guidelines.


## Coding guidelines

Follow [github](https://github.com/styleguide/) guidelines.


## Feedback

Use the [issue tracker](http://github.com/lelylan/lelylan-rb/issues) for bugs.
[Mail](mailto:touch@lelylan.com) or [Tweet](http://twitter.com/lelylan) us for any idea that can improve the project.


## Links 

* [GIT Repository](http://github.com/lelylan/lelylan-rb)
* [Lelylan Dev Center](http://dev.lelylan.com)
* [Lelylan Site](http://lelylan.com)


## Authors

[Andrea Reginato](http://twitter.com/andreareginato)


## Contributors

Special thanks to the following people for submitting patches.


## Changelog

See [CHANGELOG](people/blob/master/CHANGELOG.md)


## Copyright

Copyright (c) 2013 [Lelylan](http://lelylan.com). See [LICENSE](people/blob/master/LICENSE.md) for details.
