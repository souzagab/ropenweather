# frozen_string_literal: true

RSpec.describe Ropenweather do
  it 'has a version number' do
    expect(Ropenweather::VERSION).not_to be nil
  end

  describe 'configuration' do
    let(:configuration) { subject.configuration }

    it { is_expected.to respond_to(:configuration) }
    it 'be kind of Ropenweather::Configuration' do
      expect(configuration).to be_kind_of Ropenweather::Configuration
    end
  end

  describe 'setup' do
    let(:configuration) { subject.configuration }

    it { is_expected.to respond_to(:setup) }
    specify { expect { |b| subject.setup(&b) }.to yield_with_args(configuration) }
    specify { expect { |b| subject.setup(&b) }.not_to yield_with_no_args }
  end
end
