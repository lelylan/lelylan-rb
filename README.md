# Lelylan Ruby Gem

Ruby wrapper for [Lelylan REST APIs](http://dev.lelylan.com)


## Installation

    gem install lelylan-rb

Or if you are using bundler 

    gem "lelylan-rb"


## Resources

[Ruby gem documentation](http://rdoc.info/gems/lelylan-rb)

[Lelylan REST APIs](http://dev.lelylan.com)


## Client setup

For methods that require authentication, you'll need to setup a client with your login and password

    require "rubygems"
    require "lelylan-rb"

    @client = Lelylan::Client.new(user: "USERNAME", password: "PASSWORD")

To use with Lelylan Enterprise you'll need to set the API endpoints before instantiating a client.

    Lelylan.configure do |config|
      config.api_endpoint = "https://lelylan.house.com"
    end

    @client = Lelylan::Client.new(user: "USERNAME", password: "PASSWORD")

## Examples

Get 10 devices.

    client.devices(per: 10)

Get a device based on its URI.

    client.device("http://api.lelylan.com/devices/:id")

Search a device type based on its name.

    client.types(name: "Dimmer").first

Create a device (in this case we suppose the type is a dimmer)

    device = client.create_device(name: "Closet dimmer", type_uri: dimmer.uri)

Execute a function.

    client.execute(device.uri, function.uri)


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

Fork the repo on github and issue a pull request with your changes. No other means of supplying 
code to the team will be accepted. Provide specs with your pull request if the existing specs 
do not cover the change. Pull requests that provide new functionality without specs will not 
be pulled in under any circumstance.

### Running specs

Getting set up should require minimal effort

* Fork and clone the repository.
* Run `gem install bundler` to get the latest for the gemset.
* Run `bundle install` for dependencies.
* Run `bundle exec guard` and press enter to execute all specs.


## Spec guidelines

The following [doc](https://docs.google.com/document/d/1gi00-wwPaLk5VvoAJhBVNh9Htw4Rwmj-Ut88T4M2MwI/edit?hl=en#) demonstrates the desired way to write a spec in this project. To maintain the spec 
consistent, follow these rules.

* Use describe blocks for method names.
* Use context blocks for conditions.
* 1 assertion per example block.
* When describing methods, prefix with '#' for instance methods, '.' for class methods.


## Coding guidelines

* Keep method line counts small and easy to read.
* Do not fear the use of Ruby's tap.
* Provide API documentation in the form of YARD.


## Feedback

Use the [issue tracker](http://github.com/lelylan/lelylan-rb/issues) for any bug you find and write us a [mail](mailto:touch@lelylan.com)
for any feature idea that can improve the project. Feedback is always welcome. Always.


## Links 

* [GIT Repository](http://github.com/lelylan/lelylan-rb)
* [Lelylan Dev Center](http://dev.lelylan.com)
* [Lelylan Site](http://lelylan.com)


## Authors

[Andrea Reginato](http://twitter.com/andreareginato)


## Contributors

Special thanks to the following people for submitting patches.


## Changelog

See CHANGELOG


## Copyright

Copyright (c) 2013 [Lelylan](http://lelylan.com). See LICENSE for details.
