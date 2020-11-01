# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ropenweather::Client do
  context '#initialize' do
    it 'withouth api key must raise exception' do
      expect { described_class.new }.to raise_error ArgumentError
    end

    describe 'with api-key and default params' do
      let!(:client) { described_class.new(api_key: 'h4sh-f0rt3st') }

      it 'has api_key' do
        expect(client.api_key).not_to(be nil)
      end

      it 'default settings' do
        expect(client.base_uri).to eq('http://api.openweathermap.org/data/2.5/')
        expect(client.lang).to eq('en')
        expect(client.units).to eq('metric')
      end
    end

    describe 'with custom settings' do
      let!(:client) do
        described_class.new(api_key: 'h4sh-f0rt3st',
                                 base_uri: 'https://google.com',
                                 units: 'imperial',
                                 lang: 'pt_BR')
      end
      it 'has custom settings' do
        expect(client.base_uri).to eq('https://google.com')
        expect(client.lang).to eq('pt_BR')
        expect(client.units).to eq('imperial')
      end
    end
  end
end
