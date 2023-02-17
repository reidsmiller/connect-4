require 'spec_helper'

RSpec.describe Cell do
  describe '#initialize' do
    it 'exists' do
      a1 = Cell.new

      expect(a1).to be_instance_of(Cell)
    end

    it 'has a default value of "."' do
      a1 = Cell.new

      expect(a1.display_chr). to eq(".")
    end

    it 'can change value if selected by player' do
      a1 = Cell.new

      expect(a1.player). to eq("X")
    end

    it 'can change value if selected by computer' do
      a1 = Cell.new

      expect(a1.comp).to eq("O")
    end
  end
end