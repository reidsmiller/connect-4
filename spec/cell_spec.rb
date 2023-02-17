require 'spec_helper'

RSpec.describe Cell do
  describe '#initialize' do
    it 'exists' do
      a1 = Cell.new('a1')

      expect(a1).to be_instance_of(Cell)
    end

    it 'has a default value of "."' do
      a1 = Cell.new(:a1)

      expect(a1.value). to eq(".")
    end

    it 'can change value if selected by player' do
      a1 = Cell.new(:a1)

      a1.player_select
      expect(a1.value). to eq("X")
    end

    it 'can change value if selected by computer' do
      a1 = Cell.new(:a1)

      a1.comp_select
      expect(a1.value).to eq("O")
    end
  end
end