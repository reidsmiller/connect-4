require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @player1 = Player.new("Rick")
    @board = Board.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@player1).to be_instance_of(Player)
    end

    it 'has a name' do
      expect(@player1.name).to eq("Rick")
    end
  end

  describe '#Pieces' do
    it 'can call particular column' do
      expect(@player1.convert("B")).to eq(1)
      expect(@player1.convert("F")).to eq(5)
    end

    it 'can place a piece at appropriate place in column' do
      @player1.place("B")
      @player1.place("D")
      @player1.place("B")

      expect(@player1.board.board_array).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", "X", ".", "X", ".", ".", "."]])
    end
  end
end