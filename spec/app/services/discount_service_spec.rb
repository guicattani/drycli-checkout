# frozen_string_literal: true

require 'spec_helper'
require 'logger'
RSpec.describe DiscountService do
  let(:items) { %w[GR1 GR1 SR1] }
  let(:tallied_items) { TallyService.call(items:) }

  describe '#call' do
    it 'calculates the subtotal with discount' do
      expect(described_class.call(tallied_items:)).to eq(811)
    end

    context 'when basket is 3 GR1, 1 SR1 and 1 CF1' do
      let(:items) { %w[GR1 GR1 GR1 SR1 CF1] }

      it 'has total price of 2245' do
        expect(described_class.call(tallied_items:)).to eq(2245)
      end
    end

    context 'when basket is 2 GR1' do
      let(:items) { %w[GR1 GR1] }

      it 'has total price of 311' do
        expect(described_class.call(tallied_items:)).to eq(311)
      end
    end

    context 'when basket is 1 GR1, 3 SR1' do
      let(:items) { %w[GR1 SR1 SR1 SR1] }

      it 'has total price of 1661' do
        expect(described_class.call(tallied_items:)).to eq(1661)
      end
    end

    context 'when basket is 1 GR1, 1 SR1 and 3 CF1' do
      let(:items) { %w[GR1 SR1 CF1 CF1 CF1] }

      it 'has total price of 3057' do
        expect(described_class.call(tallied_items:)).to eq(3057)
      end
    end
  end
end
