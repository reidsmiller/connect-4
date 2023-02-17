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

    xit 'can print the board' do
      expect{@board.render}.to output(
        " A B C D E F G
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . .
 . . . . . . ."
      ).to_stdout
    end
  end
end