# frozen_string_literal: true

require_relative 'agent'

module Ropenweather
  class Client
    DEFAULT_BASE_URI = 'http://api.openweathermap.org/data/2.5'

    include Ropenweather::Agent

    attr_accessor :api_key, :base_uri, :lang, :units

    def initialize(api_key:, base_uri: DEFAULT_BASE_URI, lang: 'en', units: 'metric')
      self.api_key = api_key
      self.base_uri = base_uri
      self.lang = lang
      self.units = units
    end

    def current_weather(city:, action: 'weather')
      execute(city: city, action: action, config: config_params)
    end

    private

    def config_params
      { appid: api_key, lang: lang, units: units }
    end
  end
end
