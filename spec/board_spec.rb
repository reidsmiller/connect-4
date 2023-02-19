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

    it 'can access and change each point on the grid' do
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

  describe '#place' do
    it 'can place a piece at appropriate place in column' do
      @board.place("B", "X")
      @board.place("D", "X")
      @board.place("B", "X")
      
      expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", "X", ".", "X", ".", ".", "."]])
    end

    it 'can take an uppercase or lowercase letter for column' do
      expect(@board.place("B", "X")).to be true
      expect(@board.place("c", "X")).to be true
    end

    it 'does not allow a piece to be placed at an invalid location' do
      expect(@board.place("Z", "X")).to be false
      expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]])
    end
    
    it 'return false if column is full' do
      @board.place("B", "X")
      @board.place("B", "X")
      @board.place("B", "X")
      @board.place("B", "X")
      @board.place("B", "X")
      
      expect(@board.place("B", "X")).to be true
      
      expect(@board.place("B", "X")).to be false
    end
  end
  describe '#reset' do
    it 'can reset the board' do
      @board.place("B", "X")
      @board.place("B", "X")
      @board.place("B", "X")
      @board.place("B", "X")
      @board.place("B", "X")

      expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."]])

      @board.reset

      expect(@board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."]])
    end
  end
end