# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Ropenweather::Client do
  it_behaves_like 'Agent'

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
        expect(client.base_uri).to eq(described_class::DEFAULT_BASE_URI)
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

  context '#current_weather' do
    let!(:client) { described_class.new(api_key: ENV['API_KEY']) }

    it 'withouth city raise exception' do
      expect { client.current_weather }.to raise_error ArgumentError
    end

    describe 'sucesfull response', :vcr do

      describe 'weather' do
        let(:response) { client.current_weather(city: 'Campinas') }
        let(:response_keys) { %i(name weather main coord base visibility wind clouds dt sys timezone id cod) }

        it 'has expected keys' do
          expect(response).not_to be_nil
          response_keys.each do |key|
            expect(response).to have_key(key)
          end
        end
      end

      describe 'forecast' do
        let(:response) { client.current_weather(city: 'Campinas', action:'forecast') }
        let(:response_keys) { %i(cod message cnt list) }

        it 'has expected keys' do
          expect(response).not_to be_nil
          response_keys.each do |key|
            expect(response).to have_key(key)
          end
        end

        it 'returns a list of forecasts' do
          expect(response[:list].size).to eq(40)
        end
      end
    end

    describe 'request failed', :vcr do
      it 'city not found' do
        expect { client.current_weather(city: 'T3stc1ty') }.to raise_error Ropenweather::CityNotFound
      end
      describe 'invalid api-key' do
        let!(:client) { described_class.new(api_key: 'h4sh-f0rt3st') }
        it 'unauthorized' do
          expect { client.current_weather(city: 'Campinas') }.to raise_error Ropenweather::Unauthorized
        end
      end
    end
  end

  context '#config_params' do
    let!(:client) { described_class.new(api_key: 'h4sh-f0rt3st') }

    it 'return hash' do
      allow(client).to receive(:config_params).and_return Hash
    end
  end
end
