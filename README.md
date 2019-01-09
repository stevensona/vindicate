# Vindicate
![Build Status](http://git.ajrintl.com/astevenson/vindicate/badges/master/build.svg)

Provides Vehicle Identification Number (VIN) number format for ActiveModel. Checks length, characters, and checksum calculation.

## Usage
```ruby
#app/models/vin.rb
validates :number, vin: true # validates 'number' attribute is proper vin format
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'vindicate'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install vindicate
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
