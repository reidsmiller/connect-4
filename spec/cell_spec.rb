require 'spec_helper'

RSpec.describe Cell do
  describe '#Initialize' do
    it 'exists and has a mark' do
      cell1 = Cell.new
      expect(cell1).to be_instance_of(Cell)
      expect(cell1.mark).to eq(".")
    end
  end
end