# frozen_string_literal: true

require 'ropenweather/version'
require 'ropenweather/configuration'

module Ropenweather
  class << self
    attr_accessor :params

    def configuration
      self.params ||= Configuration.new
    end

    def setup
      yield(configuration)
    end
  end
end
