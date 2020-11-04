

# Ropenweather :gem:
A Ruby Wrapper to the OpenWeatherMap API


## Installation
This gem is only available for development, so you can clone the repo and build it yourself:



```
git clone https://github.com/souzagab/ropenweather.git
cd ropenweather
bundle exec rake install
```
Or reference the repo in your Gemfile:
```ruby
gem  'ropenweather', git:  'https://github.com/souzagab/ropenweather.git'
```

And then execute:
```
bundle install
```


## Usage
This gem uses OpenWeatherMap API and you need to register and get it  [here](https://home.openweathermap.org/api_keys).
### Instance
To use this gem, you will need to create an instance of the `Ropenweather::Client` class, the constructor can receive four parameters: `api_key, base_uri, lang, units`.
|  param| required |default |accepted values|
|--|--|--|--|--|
| `api_key`|yes||api-key from openweathermap|
|`base_uri`|no|`http://api.openweathermap.org/data/2.5`|api url|
|`lang`|no|`en`|check the accepted values [here](https://openweathermap.org/current#data)
|`units`|no|`metric`|``standard metric imperial``

#### Example

    client = Ropenweather::Client.new(api_key:'y0ur-4pi-k3y',lang:'pt_br')

### Today's [Current Weather](https://openweathermap.org/current)
Returns an hash

    client = Ropenweather::Client.new(api_key:'y0ur-4pi-k3y',lang:'pt_br')
    client.get_weather(city:'London')

#### [Forecast](https://openweathermap.org/forecast5) (5 days )
Returns an hash with an list of forecasts

    client = Ropenweather::Client.new(api_key:'y0ur-4pi-k3y',lang:'pt_br')
    response = client.get_weather(city:'London', action:'forecast')
    response[:list] # Array of forecasts


## Development

After cloning, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.






## Contributing

   This project is at the beginning of development and has a lot to be improved, contributions are welcome, and here is a list of possible improvements:


 - [ ] Wrap the api response in a class
 - [ ] Improve error handling
 - [ ] Validate method params ( format )

And more..

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
