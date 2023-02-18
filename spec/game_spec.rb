require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(@game).to be_instance_of(Game)
    end

    it 'can take a player turn' do
      @game.player_turn("B")
      expect(@game.board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."]])
    end

    it 'can take a computer turn' do
      expect(("A".."G").member?(@game.computer_turn)).to be true
    end
  end

  describe '#win game' do
    it 'returns true when 4 pieces are in a row horizontally' do
      @game.player_turn("A")
      @game.player_turn("B")
      @game.player_turn("C")
      
      expect(@game.game_win).to be nil
  
      @game.player_turn("D")
      
      expect(@game.game_win).to be true
    end

    it 'returns true when 4 player pieces are in a row diagonally up' do
      @game.board.board_array[5][1] = "O"
      @game.board.board_array[5][2] = "O"
      @game.board.board_array[5][3] = "O"
      @game.board.board_array[4][2] = "O"
      @game.board.board_array[4][3] = "O"
      @game.board.board_array[3][3] = "O"
      @game.player_turn("A")
      @game.player_turn("B")
      @game.player_turn("C")
      
      expect(@game.game_win).to be nil

      @game.player_turn("D")

      expect(@game.game_win).to be true
    end
  end
end