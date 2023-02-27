require 'spec_helper'

RSpec.describe Cell do
  describe '#Initialize' do
    it 'exists and has a mark' do
      cell1 = Cell.new(1, 2)
      expect(cell1).to be_instance_of(Cell)
      expect(cell1.mark).to eq(".")
      expect(cell1.row_pos).to eq(1)
      expect(cell1.column_pos).to eq(2)
    end
  end
end