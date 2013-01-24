# Lelylan Ruby Gem

Ruby client library for [Lelylan API](http://dev.lelylan.com)

## What is Lelylan

Lelylan makes it easy for developers to monitor and control all devices in
your house providing a simple, self descriptive and consistent representation of them. Lelylan
maps every device in your house to a unique URI which will provide a simple access over it.

With Lelylan developers can build secure applications and services that use real-time data
coming from the real world to create the future connected house.

## Requirements

Ruby client library is tested against MRI 1.9.3.


## Installation

Install the client using Bundler.

    gem 'lelylan-rb', require: 'lelylan'
    gem 'oauth2'

Development version.

    gem 'lelylan-rb', require: 'lelylan', git: 'https://github.com/lelylan/lelylan-rb', branch: 'master'


## Getting started

### Require Gem

    require 'rubygems'
    require 'lelylan-rb'
    require 'oauth2'

### Get an access token

First of all you need an access token to authoraze your requests in
Lelylan. To get one use the [OAuth2 gem](https://github.com/intridea/oauth2/)
and if you are not used to OAuth2 concepts, take 10 minutes and read the
related documentation in the [dev center](http://dev.lelylan.com/api/oauth#language=node).


```ruby
// Create a client
oauth = OAuth2::Client.new(client_id, client_secret, site: site)

// Redirect the application to the Lelylan authorization page
redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
// => http://people.lelylan.com/oauth/authorize?redirect_uri=http://localhost:3000/callback&scope=devices&response_type=code&client_id=<client-id>

// Get the access token object (authorization code is given from the previous step)
token = oauth.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
```

### Lelylan access

Once you have the access token you can access to the Lelylan API. The
following example shows how to print in the console a list of owned devices.

```ruby
# Initialize Lelylan client
lelylan = Lelylan::Client.new(token: token)

# Get the first device where the name matches with Dimmer
device = lelylan.devices(name: 'Dimmer').first
```


## Authorization flows

Lelylan support three OAuth2 authorization flows.

### Authorization code flows

```ruby
oauth = OAuth2::Client.new(client_id, client_secret, site: site)
redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
token = oauth.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
```

### Implicit grant flow

```ruby
oauth = OAuth2::Client.new(client_id, client_secret, site: site)
redirect oauth.auth_code.authorize_url(redirect_uri: redirect_uri)
token = OAuth2::AccessToken.from_kvform(client, params)
```

### Resource owner password credentials flow

```ruby
oauth = OAuth2::Client.new(client_id, client_secret, site: site)
token = oauth.password.get_token('email', 'password')
```

Access tokens, when expired, are automatically refreshed.


### Realtime services

#### TODO


## Lelylan Services

### Devices

The Device API defines a set of services to monitor and control every existing device.
Its final goal is to map every device to a unique URI which provides control over it.
[See examples](http://dev.lelylan.com/api/devices#language=node).


### History

When a device updates its properties or executes a function a new history resource with
a snapshot of all device properties is created by Lelylan, also the ones that has not been
updated. This makes it easy to recreate previous device status and extract usage patterns
to improve the way people live their house.
[See examples](http://dev.lelylan.com/api/devices/histories#language=node).

### Types

A type describes the structure of a device. In its simplest form every type can be defined
as the combination of three key elements: properties (what vary during time), functions
(what a device can do), statuses (what a device is in a specific time of its life).
[See examples](http://dev.lelylan.com/api/types#language=node).

### Properties

A property is whatever vary in a device during time. It can be the intensity in a dimmer,
the temperature in a cooling system or the volume in a television.
[See examples](http://dev.lelylan.com/api/types/properties#language=node).

### Functions

Functions defines the daily interactions you have with the devices in your house, for
example when you turn on a light, close a door or raise the temperature in a room.
With functions you can control any device in the same way you do everyday of your life.
[See examples](http://dev.lelylan.com/api/types/functions#language=node).

### Statuses

Properties are not always enough to describe the status of a device. Think at a roller
shutter for example. It has the property aperture that is 100 when open or 0 when closed.
But what if the roller shutter is opening? It is nether open or close. To have a complete
control over the device status in a specific moment of its life is to use the status API.
[See examples](http://dev.lelylan.com/api/types/statuses#language=node).

### Locations

Locations are the places we live in and where physical devices are placed. Lelylan identifies
three types of locations usually organized in a hierarchical structure: houses, floors and
rooms.
[See examples](http://dev.lelylan.com/api/locations#language=node).

### Physical devices

Physical devices are the real objects you physically interact with everyday of your life
like lights, appliances, alarms and more. To enable the communication between Lelylan and
physical devices they should provide a simple set of web services.
[See examples](http://dev.lelylan.com/api/physicals#language=node).

### Subscriptions

Get real-time updates by subscribing to a resource and its related event.
[See examples](http://dev.lelylan.com/api/realtime#language=node).

### Authenticated User Profile

Returns extended information for the authenticated user.
[See examples](http://dev.lelylan.com/api/core#user-profile).




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

```ruby
begin
  @type = Lelylan::Type.type("https://type.lelylan.com/types/not_existing_uri")
rescue Lelylan::NotFound => e
  puts "The resource #{e.message.error.uri} was not found"
end
```

Learn more about the [error response structure](http://dev.lelylan.com/rest/core#errors).


## Configurations

### API endpoint

Configuration block.

```ruby
Lelylan.configure { |c| c.endpoint = 'https://lelylan.yourhouse.com' }
@client = Lelylan::Client.new(token: token)
```

Client instance.

```ruby
@client = Lelylan::Client.new(token: token)
@client.endpoint = 'https://lelylan.yourhouse.com'
```








## Contributing

Fork the repo on github and send a pull requests with topic branches. Do not forget to
provide specs to your contribution.


### Running specs

* Fork and clone the repository.
* Run `gem install bundler` to get the latest for the gemset.
* Run `bundle install` for dependencies.
* Run `bundle exec guard` and press enter to execute all specs.


## Spec guidelines

Follow [rspec best practices](http://betterspecs.org) guidelines.


## Coding guidelines

Follow [github](https://github.com/styleguide/) guidelines.


## Feedback

Use the [issue tracker](http://github.com/lelylan/lelylan-rb/issues) for bugs.
[Mail](mailto:touch@lelylan.com) or [Tweet](http://twitter.com/lelylan) us for any idea that can improve the project.


## Links

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
