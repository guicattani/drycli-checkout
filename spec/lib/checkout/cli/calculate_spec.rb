# frozen_string_literal: true

require 'spec_helper'
require 'dry/cli'
require 'logger'
RSpec.describe Checkout::CLI::Calculate do
  subject(:calculate) { Dry.CLI(described_class) }

  let(:arguments) { %w[GR1 SR1] }

  describe '#call' do
    it 'returns empty list if nothing is passed' do
      expect(calculate.call(arguments: [])).to be_nil
    end

    it 'returns the sum of the given items' do
      expect(calculate.call(arguments:)).to eq('£8.11')
    end

    context 'missing items' do
      let(:arguments) { %w[GR1 SR1 SOMETHING] }

      before do
        allow(Utils::Log).to receive(:error)
      end

      it 'creates a log and removes the item from the list' do
        calculate.call(arguments:)
        expect(Utils::Log).to have_received(:error).with('SOMETHING not found')
      end

      it 'calculates the existing items' do
        expect(calculate.call(arguments:)).to eq('£8.11')
      end
    end
  end
end
