require 'spec_helper'

RSpec.describe Turn do
  before(:each) do
    @turn = Turn.new
    @board = Board.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(@turn).to be_instance_of(Turn)
    end

    it 'can take a player turn' do
      expect(@turn.player_turn("B")).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."]])
    end

    it 'can take a computer turn' do
      
    end
  end
end