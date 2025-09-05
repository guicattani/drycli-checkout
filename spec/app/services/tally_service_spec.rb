# frozen_string_literal: true

require 'spec_helper'
require 'logger'
RSpec.describe TallyService do
  let(:items) { %w[GR1 GR1 SR1] }

  describe '#call' do
    it 'returns empty list if nothing is passed' do
      expect(described_class.call(items: [])).to be_nil
    end

    it 'returns the sum of the given items' do
      expect(described_class.call(items:).first[:sum]).to eq(622)
    end

    context 'when missing items' do
      let(:items) { %w[GR1 SR1 SOMETHING] }

      before do
        allow(Utils::Log).to receive(:error)
      end

      it 'creates a log and removes the item from the list' do
        described_class.call(items:)
        expect(Utils::Log).to have_received(:error).with('SOMETHING not found')
      end

      it 'calculates the existing items' do
        expect(described_class.call(items:).first[:sum]).to eq(311)
      end

      it 'counts only valid items' do
        expect(described_class.call(items:).count).to eq(2)
      end
    end
  end
end
