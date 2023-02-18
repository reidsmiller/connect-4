require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(@board).to be_instance_of(Board)
    end

    it 'creates an array of 6 elements that are arrays of 7' do
      expect(@board.board_array.length).to eq(6)
      expect(@board.board_array[1].length).to eq(7)
    end

    it 'can print the board' do
      expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]])
    end

    it 'can change access and change each point on the grid' do
      #change B4 to X
      @board.board_array[3][1] = "X"

      expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]])
    end
  end

  it 'can place a piece at appropriate place in column' do
    @board.place("B")
    @board.place("D")
    expect(@board.place("B")).to be true

    expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", "X", ".", ".", ".", ".", "."],
      [".", "X", ".", "X", ".", ".", "."]])
  end
  it 'does not allow a piece to be placed at an invalid location' do
    expect(@board.place("Z")).to be false
    expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."],
      [".", ".", ".", ".", ".", ".", "."]])
  end

  it 'cannot place a token in column if the column is full' do
    @board.place("B")
    @board.place("B")
    @board.place("B")
    @board.place("B")
    @board.place("B")

    expect(@board.place("B")).to be false
  end
end