# frozen_string_literal: true

require 'spec_helper'
require 'dry/cli'
RSpec.describe Checkout::CLI::Calculate do
  describe '#call' do
    let(:items) { %w[GR1 SR1] }

    it 'returns the sum of the given items' do
      expect(described_class.call(items)).to eq(811)
    end
  end
end
