# frozen_string_literal: true
require 'rest-client'
require 'json'

module Ropenweather
  module Agent
    def execute(city:, action:, config:)
      query = encode_query({ q: city }.merge(config))
      url = "#{base_uri}/#{action}?#{query}"

      response = RestClient.get(url)

      JSON.parse(response, symbolize_names: true)

    rescue => exception
      # TODO: Isolate Exception handler in method
      message = exception.body

      case exception.class.to_s

      when 'RestClient::NotFound'
        raise CityNotFound, message
      when 'RestClient::Unauthorized'
        raise Unauthorized, message
      else
        raise StandardError, message
      end
    end

    private

    def encode_query(params = {})
      RestClient::Utils.encode_query_string params
    end
  end
end
