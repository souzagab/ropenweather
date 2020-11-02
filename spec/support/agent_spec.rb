# frozen_string_literal: true
require 'spec_helper'

RSpec.shared_examples_for 'Agent' do
  subject { described_class.new(api_key: ENV['API-KEY']) }
  let(:config_params) { { appid: subject.api_key } }

  it '#execute', :vcr do
    allow(subject).to receive(:execute)
      .with(city: 'Santiago', action: 'weather', config: config_params)
      .and_return(Hash)
  end

  it '#encode_query' do
    allow(subject).to receive(:encode_query).with(config_params).and_return(String)
  end
end
