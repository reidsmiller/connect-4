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

  describe '#Intelligent Computer' do
    it 'can block vertically' do
      @game.board.place("B", "X")
      @game.board.place("B", "X")

      expect(@game.check_for_3(@game.vertical_sort)).to eq(false)
      expect(@game.board.board_array[2][1].mark).to eq(".")
      expect(@game.comp_check).to be false

      @game.board.place("B", "X")

      expect(@game.check_for_3(@game.vertical_sort)).to eq(true)
      expect(@game.board.board_array[2][1].mark).to eq("O")
    end

    it 'can block horizontally right' do
      @game.board.place("A", "X")
      @game.board.place("B", "X")

      expect(@game.check_for_3(@game.board.board_array)).to be false
      expect(@game.comp_check).to be false
      expect(@game.board.board_array[5][3].mark).to eq(".")
      @game.board.place("C", "X")

      expect(@game.check_for_3(@game.board.board_array)).to be true
      expect(@game.board.board_array[5][3].mark).to eq("O")
    end

    it 'can block horizontally left before right' do
      @game.board.place("B", "X")
      @game.board.place("C", "X")

      expect(@game.check_for_3(@game.board.board_array)).to be false
      expect(@game.comp_check).to be false
      expect(@game.board.board_array[5][0].mark).to eq(".")

      @game.board.place("D", "X")

      expect(@game.check_for_3(@game.board.board_array)).to be true
      expect(@game.comp_check).to be true
      expect(@game.board.board_array[5][0].mark).to eq("O")
    end

    it 'only blocks when it can place at correct position' do
      @game.board.place("B", "X")
      @game.board.place("C", "O")
      @game.board.place("D", "O")
      @game.board.place("B", "X")
      @game.board.place("C", "X")
      @game.board.place("D", "X")
      
      expect(@game.comp_check).to be false
      expect(@game.board.board_array[5][0].mark).to eq(".")

      @game.board.place("A", "X")

      expect(@game.comp_check).to be true
      expect(@game.board.board_array[4][0].mark).to eq("O")
    end

    it 'blocks diagonally at position[1]' do
      @game.board.place("B", "X")
      @game.board.place("C", "O")
      @game.board.place("D", "X")
      @game.board.place("C", "X")
      @game.board.place("D", "O")
      @game.board.place("D", "X")
  
      @game.board.place("A", "X")
      @game.board.place("C", "X")
  
      expect(@game.comp_check).to be false
      expect(@game.board.board_array[4][1].mark).to eq(".")
      
      @game.board.place("D", "X")
      expect(@game.comp_check).to be true
      expect(@game.board.board_array[4][1].mark).to eq("O")
    end

    it 'can win at position[2]' do
      @game.board.place("A", "O")
      @game.board.place("B", "O")

      expect(@game.comp_check).to be false
      expect(@game.board.board_array[5][2].mark).to eq(".")

      @game.board.place("D", "O")

      expect(@game.comp_check).to be true
      expect(@game.board.board_array[5][2].mark).to eq("O")
    end

    it 'chooses to win over block' do
      @game.board.place("B", "X")
      @game.board.place("C", "O")
      @game.board.place("D", "X")
      @game.board.place("C", "X")
      @game.board.place("D", "O")
      @game.board.place("D", "X")
      @game.board.place("A", "X")
      @game.board.place("C", "X")
      @game.board.place("D", "X")
      @game.board.place("E", "X")
      @game.board.place("F", "O")
      @game.board.place("G", "X")
      @game.board.place("E", "O")
      @game.board.place("G", "O")

      expect(@game.comp_check).to be true
      expect(@game.board.board_array[4][1].mark).to eq(".")
      expect(@game.board.board_array[4][5].mark).to eq("O")
    end
  end
end