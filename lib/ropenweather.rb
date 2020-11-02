# frozen_string_literal: true

require 'ropenweather/version'
require 'ropenweather/client'
require 'ropenweather/agent'

module Ropenweather
  class Unauthorized < StandardError; end
  class CityNotFound < StandardError; end
end
