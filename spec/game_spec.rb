require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(@game).to be_instance_of(Game)
    end
  end

  describe '#win game' do
    it 'returns true when 4 pieces are in a row horizontally' do
      @game.board.place("A", "X")
      @game.board.place("B", "X")
      @game.board.place("C", "X")
      
      expect(@game.game_win).to be nil
  
      @game.board.place("D", "X")
      @game.win?
      expect(@game.game_win).to be true
    end

    it 'returns true when 4 pieces are in a row horizontally in a different orientation' do
      @game.board.place("A", "X")
      @game.board.place("A", "O")
      @game.board.place("B", "X")
      @game.board.place("B", "O")
      @game.board.place("C", "X")
      @game.board.place("C", "O")
      @game.board.place("D", "O")
      @game.board.place("D", "O")
      @game.win?
      expect(@game.game_win).to be false
  
    end
  
    it 'returns false if the computer has 4 pieces in a row horizontally' do
      #forcing "O"'s since our computer is not that smart yet
  
      @game.board.place("A", "O")
      @game.board.place("B", "O")
      @game.board.place("C", "O")
  
      expect(@game.game_win).to be nil
  
      @game.board.place("D", "O")
      @game.win?
  
      expect(@game.game_win).to be false
    end
  
    it 'returns true when 4 pieces are in a row vertically' do
      @game.board.place("B", "X")
      @game.board.place("B", "X")
      @game.board.place("B", "X")
  
      expect(@game.game_win).to be nil
  
      @game.board.place("B", "X")
      @game.win?
      expect(@game.game_win).to be true
    end
  
    it 'returns false when 4 computer pieces are in a row vertically' do
      #forcing "O"'s since our computer is not that smart yet
      @game.board.place("C", "O")
      @game.board.place("C", "O")
      @game.board.place("C", "O")
  
      expect(@game.game_win).to be nil
  
      @game.board.place("C", "O")
      @game.win?
  
      expect(@game.game_win).to be false
    end

    it 'returns true when 4 player pieces are in a row diagonally up' do
      @game.board.board_array[5][1].mark = "O"
      @game.board.board_array[5][2].mark = "O"
      @game.board.board_array[5][3].mark = "O"
      @game.board.board_array[4][2].mark = "O"
      @game.board.board_array[4][3].mark = "O"
      @game.board.board_array[3][3].mark = "O"
      @game.board.place("A", "X")
      @game.board.place("B", "X")
      @game.board.place("C", "X")
      
      expect(@game.game_win).to be nil

      @game.board.place("D", "X")
      @game.win?
      expect(@game.game_win).to be true
    end

    it 'returns true when 4 player pieces are in a row diagonally down' do
      @game.board.board_array[5][0].mark = "O"
      @game.board.board_array[4][0].mark = "O"
      @game.board.board_array[3][0].mark = "O"
      @game.board.board_array[5][1].mark = "O"
      @game.board.board_array[4][1].mark = "O"
      @game.board.board_array[5][2].mark = "O"
      @game.board.place("A", "X")
      @game.board.place("B", "X")
      @game.board.place("C", "X")
      
      expect(@game.game_win).to be nil

      @game.board.place("D", "X")
      @game.win?
      expect(@game.game_win).to be true
    end

    it 'is a draw when no available spots are left and no winner is found' do
      @game.board.place("A", "X")
      @game.board.place("B", "X")
      @game.board.place("D", "X")
      @game.board.place("G", "X")
      @game.board.board_array[5][2].mark = "O"
      @game.board.board_array[5][4].mark = "O"
      @game.board.board_array[5][5].mark = "O"
      @game.board.board_array[4][0].mark = "O"
      @game.board.board_array[4][1].mark = "O"
      @game.board.board_array[4][2].mark = "O"
      @game.board.board_array[4][5].mark = "O"
      @game.board.place("D", "X")
      @game.board.place("E", "X")
      @game.board.place("G", "X")
      @game.board.place("B", "X")
      @game.board.place("D", "X")
      @game.board.place("E", "X")
      @game.board.board_array[3][0].mark = "O"
      @game.board.board_array[3][2].mark = "O"
      @game.board.board_array[3][5].mark = "O"
      @game.board.board_array[3][6].mark = "O"
      @game.board.place("A", "X")
      @game.board.place("B", "X")
      @game.board.place("C", "X")
      @game.board.place("F", "X")
      @game.board.place("G", "X")
      @game.board.board_array[2][3].mark = "O"
      @game.board.board_array[2][4].mark = "O"
      @game.board.place("A", "X")
      @game.board.place("D", "X")
      @game.board.place("E", "X")
      @game.board.board_array[1][1].mark = "O"
      @game.board.board_array[1][2].mark = "O"
      @game.board.board_array[1][5].mark = "O"
      @game.board.board_array[1][6].mark = "O"
      @game.board.board_array[0][0].mark = "O"
      @game.board.board_array[0][2].mark = "O"
      @game.board.board_array[0][4].mark = "O"
      @game.board.board_array[0][5].mark = "O"
      @game.board.place("B", "X")
      @game.board.place("D", "X")

      @game.win?
      expect(@game.game_win).to be nil
      expect(@game.game_draw).to be false

      @game.board.place("G", "X")
      @game.win?
      expect(@game.game_win).to be nil
      expect(@game.game_draw).to be true

    end
  end
end