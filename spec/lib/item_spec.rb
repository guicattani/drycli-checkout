# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Item do
  describe '#find' do
    it 'returns a Item model with the given config' do
      item = described_class.find('GR1')
      expect(item.name).to eq('Green tea')
    end

    it 'returns nil if an item is not found' do
      item = described_class.find('NOT FOUND')
      expect(item).to be_nil
    end
  end
end
