# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ropenweather::Configuration do
  it { is_expected.to be_kind_of Ropenweather::Configuration }

  describe 'is expected have setters for' do
    it 'api_key' do
      subject.api_key = 'hash123'
      expect(subject.api_key).to be('hash123')
    end
    it 'base_uri' do
      subject.base_uri = 'http://api.weathermap.com/'
      expect(subject.base_uri).to be('http://api.weathermap.com/')
    end
  end
end
